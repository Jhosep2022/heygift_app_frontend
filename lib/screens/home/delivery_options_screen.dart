import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:heygift_app_frontend/screens/home/payment_screen.dart';

class DeliveryOptionsScreen extends StatefulWidget {
  final int completedSteps;

  DeliveryOptionsScreen({required this.completedSteps});

  @override
  _DeliveryOptionsScreenState createState() => _DeliveryOptionsScreenState();
}

class _DeliveryOptionsScreenState extends State<DeliveryOptionsScreen> {
  String deliveryMethod = "HeyGift";
  bool isImmediateDelivery = true;
  TextEditingController emailController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

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
            _buildDeliveryOptions(),
            SizedBox(height: 20),
            _buildDeliveryTimeOptions(),
            Spacer(),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Entrega", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: Text("Vía HeyGift"),
                value: "HeyGift",
                groupValue: deliveryMethod,
                onChanged: (value) {
                  setState(() {
                    deliveryMethod = value!;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: Text("Vía Email"),
                value: "Email",
                groupValue: deliveryMethod,
                onChanged: (value) {
                  setState(() {
                    deliveryMethod = value!;
                  });
                },
              ),
            ),
          ],
        ),
        if (deliveryMethod == "Email")
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email del destinatario *",
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
      ],
    );
  }

  Widget _buildDeliveryTimeOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hora de entrega", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: RadioListTile<bool>(
                title: Text("Ahora"),
                value: true,
                groupValue: isImmediateDelivery,
                onChanged: (value) {
                  setState(() {
                    isImmediateDelivery = value!;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<bool>(
                title: Text("Más tarde"),
                value: false,
                groupValue: isImmediateDelivery,
                onChanged: (value) {
                  setState(() {
                    isImmediateDelivery = value!;
                  });
                },
              ),
            ),
          ],
        ),
        if (!isImmediateDelivery)
          Column(
            children: [
              ListTile(
                title: Text("Seleccionar fecha"),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                subtitle: Text(selectedDate != null
                    ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                    : "No seleccionada"),
              ),
              ListTile(
                title: Text("Seleccionar hora"),
                trailing: Icon(Icons.access_time),
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      selectedTime = pickedTime;
                    });
                  }
                },
                subtitle: Text(selectedTime != null
                    ? selectedTime!.format(context)
                    : "No seleccionada"),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String formattedDate = selectedDate != null
            ? DateFormat('dd/MM/yyyy').format(selectedDate!)
            : "Inmediato";
        String formattedTime = selectedTime != null
            ? selectedTime!.format(context)
            : "Inmediato";

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentScreen(
              message: "¡Feliz Aniversario!",
              brandName: "Multicenter",
              amount: 80.0,
              senderName: "Isabella Ortiz",
              receiverName: "Juan Perez",
              deliveryEmail: emailController.text,
              deliveryDate: formattedDate,
              deliveryTime: formattedTime,
            ),
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
    );
  }
}
