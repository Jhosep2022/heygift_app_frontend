import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'BO');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/Isologo-Color-PNG.png',
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'HeyGift',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5A2D81),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Acción al presionar "Ingresar"
                },
                child: const Text(
                  'Ya tienes cuenta? Ingresar',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
                initialValue: number,
                textFieldController: controller,
                formatInput: false,
                inputDecoration: InputDecoration(
                  hintText: '67399220',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                selectorTextStyle: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Acción al presionar "Continue"
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5A2D81),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Continue'),
              ),
              const SizedBox(height: 20),
              const Text(
                'O continuar con',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/icons/icons8-facebook-nuevo-48.png'), 
                    iconSize: 40,
                    onPressed: () {
                      // Acción para iniciar sesión con Facebook
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: Image.asset('assets/icons/icons8-logo-de-google-48.png'), 
                    iconSize: 40,
                    onPressed: () {
                      // Acción para iniciar sesión con Google
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: Image.asset('assets/icons/icons8-mac-os-30.png'), // Asegúrate de tener los íconos en esta ruta
                    iconSize: 40,
                    onPressed: () {
                      // Acción para iniciar sesión con Apple
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
