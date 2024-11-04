import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';
import 'package:heygift_app_frontend/screens/home/delivery_options_screen.dart';
import '../../components/ProgressIndicatorWidget.dart';

class ChangeFromGiftCardScreen extends StatefulWidget {
  final int completedSteps;
  final double amount;

  ChangeFromGiftCardScreen({required this.completedSteps, required this.amount});

  @override
  _ChangeFromGiftCardScreenState createState() => _ChangeFromGiftCardScreenState();
}

class _ChangeFromGiftCardScreenState extends State<ChangeFromGiftCardScreen> {
  final TextEditingController senderController = TextEditingController();
  final TextEditingController receiverController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Image.asset(
          'assets/icons/HeyGift-Logo-Variante-PNG.png',
          height: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProgressIndicatorWidget(currentStep: 4, completedSteps: widget.completedSteps),
            SizedBox(height: 20),
            Text(
              "Personaliza tu gift card",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildTextField("De", "Nombre del remitente *", senderController, 50),
            SizedBox(height: 10),
            _buildTextField("Para", "Nombre del destinatario *", receiverController, 50),
            SizedBox(height: 10),
            _buildTextField("Mensaje", "Escribe un mensaje...", messageController, 200),
            Spacer(),
            _buildActionButtons(context),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller, int maxLength) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          controller: controller,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hint,
            counterText: "${controller.text.length}/$maxLength caracteres",
          ),
          onChanged: (value) {
            setState(() {}); // Actualiza el contador de caracteres
          },
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeliveryOptionsScreen(completedSteps: widget.completedSteps + 1),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF6A1B9A),
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              'Continuar',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF6A1B9A),
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              'Volver',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst); // Vuelve a la pantalla inicial
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF6A1B9A),
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              'Cancelar',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
