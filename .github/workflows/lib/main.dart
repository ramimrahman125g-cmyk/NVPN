import 'package:flutter/material.dart';

void main() => runApp(const RVPNApp());

class RVPNApp extends StatelessWidget {
  const RVPNApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RVPN',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.greenAccent,
      ),
      home: const RVPNHomeScreen(),
    );
  }
}

class RVPNHomeScreen extends StatefulWidget {
  const RVPNHomeScreen({Key? key}) : super(key: key);

  @override
  _RVPNHomeScreenState createState() => _RVPNHomeScreenState();
}

class _RVPNHomeScreenState extends State<RVPNHomeScreen> {
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RVPN - Custom Tunnel'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isConnected ? 'STATUS: CONNECTED' : 'STATUS: DISCONNECTED',
              style: TextStyle(
                color: isConnected ? Colors.greenAccent : Colors.redAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                setState(() {
                  isConnected = !isConnected;
                });
              },
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isConnected ? Colors.green : Colors.grey.shade800,
                  boxShadow: [
                    BoxShadow(
                      color: (isConnected ? Colors.green : Colors.black).withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    isConnected ? Icons.power_settings_new : Icons.power_off,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Active Config: https://s.stun.su/9WFRVDff1SX6RKzG',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
