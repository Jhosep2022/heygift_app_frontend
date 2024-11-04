import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';
import 'package:heygift_app_frontend/screens/home/brand_detail_screen.dart';
import 'package:heygift_app_frontend/screens/home/customize_gift_card_screen.dart';
import 'package:heygift_app_frontend/screens/home/message_screen.dart';
import '../../components/ProgressIndicatorWidget.dart';


class SelectAmountScreen extends StatefulWidget {
  final int completedSteps;

  SelectAmountScreen({required this.completedSteps});

  @override
  _SelectAmountScreenState createState() => _SelectAmountScreenState();
}

class _SelectAmountScreenState extends State<SelectAmountScreen> {
  double amount = 80.0; // Valor inicial

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
            ProgressIndicatorWidget(currentStep: 2, completedSteps: widget.completedSteps),
            SizedBox(height: 20),
            _buildSelectedGiftCard(),
            SizedBox(height: 20),
            _buildAmountSelector(),
            Spacer(),
            _buildActionButtons(context),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _buildSelectedGiftCard() {
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
              'assets/images/udabol.jpg',
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
                    'Bs. ${amount.toStringAsFixed(2)} Gift Card',
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

  Widget _buildAmountSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Introduce el importe de la giftcard",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: 'Bs. ',
            border: UnderlineInputBorder(),
          ),
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          onChanged: (value) {
            setState(() {
              double? enteredAmount = double.tryParse(value);
              if (enteredAmount != null && enteredAmount >= 50 && enteredAmount <= 300) {
                amount = enteredAmount;
              }
            });
          },
        ),
        Divider(),
        Text(
          "Desde Bs. 50 hasta Bs. 300",
          style: TextStyle(color: Colors.grey),
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
                builder: (context) => MessageScreen(
                  completedSteps: 2, 
                  amount: amount, 
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
        ),

        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BrandDetailScreen(
                  brandName: 'Brand Name',
                  category: 'Category',
                  description: 'Description',
                  imagePath: 'assets/images/brand_image.jpg',
                  galleryImages: ['assets/images/gallery1.jpg', 'assets/images/gallery2.jpg'],
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
              'Cancelar',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
