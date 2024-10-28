import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/screens/home/home_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatelessWidget {
  final String phoneNumber;
  final String userName;

  OTPVerificationScreen({required this.phoneNumber, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen de ilustración
            Image.asset(
              'assets/images/number.png',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            
            Text(
              'Bienvenida, $userName!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A1B9A),
              ),
            ),
            SizedBox(height: 10),
            // Texto de instrucciones
            Text(
              'Ingresa el código enviado al $phoneNumber',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            
            PinCodeTextField(
              appContext: context,
              length: 4, 
              obscureText: true,
              animationType: AnimationType.fade, 
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.purple.shade100,
                inactiveFillColor: Colors.white,
                activeColor: Colors.purple,
                inactiveColor: Colors.purple,
                selectedColor: Colors.purple,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              onCompleted: (v) {
                // Lógica al completar el código OTP
                print("Código OTP ingresado: $v");
                // Redirige a la pantalla Home
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              onChanged: (value) {
                print(value); 
              },
            ),
            SizedBox(height: 20),
           
            GestureDetector(
              onTap: () {
                // Lógica para reenviar código
              },
              child: Text(
                'Reenviar código',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Botón de regreso
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Atrás', style: TextStyle(color: Color(0xFF6A1B9A))),
            ),
          ],
        ),
      ),
    );
  }
}
