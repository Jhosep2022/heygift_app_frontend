import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';
import 'package:heygift_app_frontend/screens/conect/connect_tab_screen.dart';

import 'qr_scanner_screen.dart';

class ConnectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/icons/HeyGift-Logo-Variante-PNG.png',
                  height: 40,
                ),
              ),
            ),
            Row(
              children: [
              IconButton(
                icon: Icon(Icons.person_add_alt, color: Colors.black),
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConnectTabScreen()),
                );
                },
              ),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.qr_code_scanner, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRScannerScreen()),
                  );
                },
              ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barra de búsqueda
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Buscar',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Lista de contactos
            Expanded(
              child: ListView(
                children: [
                  _buildContactCard(
                    image: 'assets/images/utepsa.jpg',
                    name: 'Monica Mercado',
                    relation: 'Amiga',
                    date: 'Cumpleaños: 3 de Mayo',
                    quote: '"Mis dulces 25 🎉"',
                    wishes: ['assets/images/udabol.jpg', 'assets/images/panaderia.jpg', 'assets/images/udabol.jpg'],
                  ),
                  _buildContactCard(
                    image: 'assets/images/utepsa.jpg',
                    name: 'Juan Camilo',
                    relation: 'Boyfriend',
                    date: 'Aniversario: 20 de Junio',
                    quote: '"Quiero un súper regalo"',
                    wishes: ['assets/images/udabol.jpg', 'assets/images/panaderia.jpg', 'assets/images/udabol.jpg'],
                  ),
                  _buildContactCard(
                    image: 'assets/images/utepsa.jpg',
                    name: 'Marcia Ulloa',
                    relation: 'Hermana',
                    date: 'Cumpleaños: 25 de Junio',
                    quote: '"Sorpréndanme 😌"',
                    wishes: ['assets/images/udabol.jpg', 'assets/images/panaderia.jpg', 'assets/images/udabol.jpg'],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required String image,
    required String name,
    required String relation,
    required String date,
    required String quote,
    required List<String> wishes,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 170,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 96, 7, 111),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Enviar regalo',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      Image.asset(
                        'assets/icons/Isologo-Color-PNG.png',
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            // Información del contacto en la columna derecha
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(relation, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(date, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(quote, style: TextStyle(color: Colors.black)),
                  SizedBox(height: 10),
                  // Lista de deseos
                  Text('Lista de deseos:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Row(
                    children: wishes.map((wishImage) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            wishImage,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
