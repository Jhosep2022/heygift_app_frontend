import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';
import 'package:heygift_app_frontend/screens/home/home_screen.dart';

class EmprendimientosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Image.asset(
          'assets/icons/HeyGift-Logo-Variante-PNG.png',
          height: 40,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Campo de búsqueda
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
                  // Sección de 'Cómo funciona HeyGift'
                  _buildHowItWorksSection(context),
                  SizedBox(height: 20),
                  // Título de 'Emprendimientos'
                  Text(
                    'Emprendimientos',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // GridView de emprendimientos
                  GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    children: [
                      _buildBrandCard('Le Mans', 'assets/images/panaderia.jpg', context),
                      _buildBrandCard('Multicenter', 'assets/images/udabol.jpg', context),
                      _buildBrandCard('Casa Ideas', 'assets/images/panaderia.jpg', context),
                      _buildBrandCard('Tienda Amiga', 'assets/images/udabol.jpg', context),
                      _buildBrandCard('Tauro', 'assets/images/panaderia.jpg', context),
                      _buildBrandCard('Dismac', 'assets/images/udabol.jpg', context),
                      _buildBrandCard('Muebles Hurtado', 'assets/images/panaderia.jpg', context),
                      _buildBrandCard('Agimex', 'assets/images/udabol.jpg', context),
                      _buildBrandCard('Cine Center', 'assets/images/panaderia.jpg', context),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  // Función para crear la sección de 'Cómo funciona HeyGift' con navegación
  Widget _buildHowItWorksSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF512B7A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '¿Cómo funciona HeyGift?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildHowItWorksStep('Selecciona una marca/negocio para regalar', Icons.store),
                _buildArrowIcon(),
                _buildHowItWorksStep('Compra y personaliza tu GiftCard', Icons.card_giftcard),
                _buildArrowIcon(),
                _buildHowItWorksStep('Haz feliz a tus seres queridos', Icons.sentiment_satisfied),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Función para crear cada paso con ícono y descripción
  Widget _buildHowItWorksStep(String description, IconData icon) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Color(0xFF512B7A),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 100,
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20), // Ajuste para hacer más espacio en la parte superior
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          top: -22, // Posición ajustada para que el ícono esté completamente visible
          left: 25,
          right: 25,
          child: CircleAvatar(
            radius: 22, // Tamaño de borde morado
            backgroundColor: Colors.purple.shade100,
            child: CircleAvatar(
              radius: 20, // Tamaño interior blanco
              backgroundColor: Colors.white,
              child: Icon(icon, size: 20, color: Color(0xFF512B7A)),
            ),
          ),
        ),
      ],
    );
  }

  // Función para crear las flechas entre los pasos
  Widget _buildArrowIcon() {
    return Icon(Icons.arrow_forward, color: Color(0xFF512B7A), size: 20);
  }

  // Función para crear cada tarjeta de marca/emprendimiento
  Widget _buildBrandCard(String title, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 5.0,
                color: Colors.black.withOpacity(0.7),
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
