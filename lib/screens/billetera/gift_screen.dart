// lib/screens/gift/gift_screen.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';

class GiftScreen extends StatefulWidget {
  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Colores más suaves para el pie de tarjeta
  final List<Color> footerColors = [
    Colors.redAccent.withOpacity(0.6),
    Colors.blueAccent.withOpacity(0.6),
    Colors.greenAccent.withOpacity(0.6),
    Colors.orangeAccent.withOpacity(0.6),
    Colors.purpleAccent.withOpacity(0.6),
    Colors.blueGrey.withOpacity(0.6),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color getRandomFooterColor() {
    final random = Random();
    return footerColors[random.nextInt(footerColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/icons/HeyGift-Logo-Variante-PNG.png',
          height: 40,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.purple,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Compras'),
              Tab(text: 'Regalos'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildGiftCardList([
                  {
                    'title': '¡Feliz Aniversario!',
                    'amount': 'Bs. 150',
                    'store': 'TAURO',
                    'image': 'assets/images/udabol.jpg'
                  },
                  {
                    'title': 'Multicenter',
                    'amount': 'Bs. 50',
                    'store': 'Multicenter',
                    'image': 'assets/images/panaderia.jpg'
                  },
                ]),
                _buildGiftCardList([
                  {
                    'title': '¡Felicidades querida Camila!',
                    'amount': 'Bs. 100',
                    'store': 'Cualquier tienda',
                    'image': 'assets/images/panaderia.jpg'
                  },
                  {
                    'title': '¡Que los cumplas feliz!',
                    'amount': 'Bs. 50',
                    'store': 'Nike',
                    'image': 'assets/images/udabol.jpg'
                  },
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftCardList(List<Map<String, String>> cards) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        final footerColor = getRandomFooterColor(); // Obtiene un color aleatorio para el pie de la tarjeta

        return Card(
          margin: EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                  image: DecorationImage(
                    image: AssetImage(card['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: footerColor, // Usa el color suave para el pie de la tarjeta
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      card['amount']!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      card['store']!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
