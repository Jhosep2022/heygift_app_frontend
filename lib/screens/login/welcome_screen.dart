import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/screens/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(74, 24, 71, 1.0), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.asset(
              'assets/icons/Isologo-Color-PNG.png', 
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'HeyGift',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Get started with HeyGift',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF5A2D81),
              minimumSize: const Size(300, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              ),
              child: const Text(
                'Ingresar',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              // Acción al presionar "Continuar como invitado"
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF5A2D81),
              minimumSize: const Size(300, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              ),
                child: const Text(
                'Continuar como invitado',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}