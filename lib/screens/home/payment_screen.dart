import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';

class PaymentScreen extends StatefulWidget {
  final String message;
  final String brandName;
  final double amount;
  final String senderName;
  final String receiverName;
  final String deliveryEmail;
  final String deliveryDate;
  final String deliveryTime;

  PaymentScreen({
    required this.message,
    required this.brandName,
    required this.amount,
    required this.senderName,
    required this.receiverName,
    required this.deliveryEmail,
    required this.deliveryDate,
    required this.deliveryTime,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String paymentMethod = 'Tarjeta';
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGiftCardPreview(),
            SizedBox(height: 20),
            Text(
              widget.message,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildGiftCardDetails(),
            Divider(),
            _buildPaymentOptions(),
            if (paymentMethod == 'Tarjeta') _buildCardPaymentFields(),
            SizedBox(height: 20),
            _buildPayButton(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _buildGiftCardPreview() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/udabol.jpg', // Imagen de ejemplo
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFF333333),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bs. ${widget.amount.toStringAsFixed(2)} Gift Card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'HeyGift',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftCardDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Marca: ${widget.brandName}"),
        Text("Importe de Giftcard: Bs. ${widget.amount.toStringAsFixed(2)}"),
        Text("De: ${widget.senderName}"),
        Text("Para: ${widget.receiverName}"),
        Text("Entrega: ${widget.deliveryEmail}"),
        Text("Hora de entrega: ${widget.deliveryDate} ${widget.deliveryTime}"),
      ],
    );
  }

  Widget _buildPaymentOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pago",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text("Total a pagar: Bs. ${widget.amount.toStringAsFixed(2)}"),
        Text("Pagar con:"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: Text("Tarjeta", textAlign: TextAlign.center),
                value: "Tarjeta",
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value!;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: Text("Transferencia", textAlign: TextAlign.center),
                value: "Transferencia",
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value!;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: Text("QR", textAlign: TextAlign.center),
                value: "QR",
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }




  Widget _buildCardPaymentFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: cardNumberController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Número de tarjeta",
            hintText: "1234 5678 9101 2212",
            border: UnderlineInputBorder(),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: expirationDateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: "Fecha de expiración",
                  hintText: "MM/YY",
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: cvvController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "CVV",
                  hintText: "123",
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        CheckboxListTile(
          title: Text("Guardar método de pago"),
          value: false,
          onChanged: (value) {},
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }

  Widget _buildPayButton() {
    return ElevatedButton(
      onPressed: () {
        // Lógica para procesar el pago
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
          'Pagar Bs. ${widget.amount.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
