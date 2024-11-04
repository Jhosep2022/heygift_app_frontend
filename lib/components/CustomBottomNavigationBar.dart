// lib/components/CustomBottomNavigationBar.dart
import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/screens/billetera/gift_screen.dart';
import 'package:heygift_app_frontend/screens/conect/connect_screen.dart';
import 'package:heygift_app_frontend/screens/home/home_screen.dart';
import 'package:heygift_app_frontend/screens/perfil/profile_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Conect'),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Billetera'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      onTap: (index) {
        switch (index) {
          case 0: // Home
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          break;
          case 1: // Conect
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ConnectScreen()),
            );
          break;
          case 2: // Billetera
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => GiftScreen()),
            );
          break;
          case 3: // Perfil
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          break;
          // Agrega otros casos si necesitas navegación para las otras opciones
        }
      },
    );
  }
}
