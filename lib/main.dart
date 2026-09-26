import 'package:flutter/material.dart';

void main() {
  runApp(const RVPNApp());
}

class RVPNApp extends StatelessWidget {
  const RVPNApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RVPN',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF121212),
        useMaterial3: true,
      ),
      home: const RVPNHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RVPNHomeScreen extends StatefulWidget {
  const RVPNHomeScreen({super.key});

  @override
  State<RVPNHomeScreen> createState() => _RVPNHomeScreenState();
}

class _RVPNHomeScreenState extends State<RVPNHomeScreen> {
  bool isConnected = false;
  bool isConnecting = false;

  void toggleVpn() {
    setState(() {
      isConnecting = true;
    });

    // Simulated connection delay (Ekhane VPN package er connection logic add korbe)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isConnecting = false;
        isConnected = !isConnected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RVPN',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Status Icon with Animation/Glow effect feel
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isConnected 
                    ? Colors.green.withOpacity(0.15) 
                    : Colors.red.withOpacity(0.15),
              ),
              child: Icon(
                Icons.vpn_key_rounded,
                size: 90,
                color: isConnected ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
            const SizedBox(height: 30),
            
            // Connection Status Text
            Text(
              isConnecting 
                  ? 'Connecting...' 
                  : (isConnected ? 'Connected' : 'Disconnected'),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: isConnecting 
                    ? Colors.orangeAccent 
                    : (isConnected ? Colors.greenAccent : Colors.redAccent),
              ),
            ),
            const SizedBox(height: 10),
            
            Text(
              isConnected ? 'Your connection is secure' : 'Tap to connect securely',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 50),
            
            // Power / Connect Button
            GestureDetector(
              onTap: isConnecting ? null : toggleVpn,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: isConnected 
                        ? [Colors.red.shade700, Colors.red.shade900]
                        : [Colors.green.shade600, Colors.green.shade800],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (isConnected ? Colors.red : Colors.green).withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: isConnecting
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Icon(
                          isConnected ? Icons.power_settings_new : Icons.power_settings_new,
                          size: 60,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
