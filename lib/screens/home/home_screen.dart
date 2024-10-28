import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';
import 'package:heygift_app_frontend/screens/home/brands_screen.dart';

class HomeScreen extends StatelessWidget {
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
                  // Categorías
                  GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    children: [
                      _buildCategoryCard('Deporte', 'assets/icons/Deporte.png', Colors.blue, context),
                      _buildCategoryCard('Moda', 'assets/icons/Moda.png', Colors.pink, context),
                      _buildCategoryCard('Hogar', 'assets/icons/Hogar.png', Colors.yellow, context),
                      _buildCategoryCard('Restaurantes', 'assets/icons/Restaurantes.png', Colors.orange, context),
                      _buildCategoryCard('Cosméticos', 'assets/icons/Cosmeticos.png', Colors.green, context),
                      _buildCategoryCard('Entretenimiento', 'assets/icons/Entretenimiento.png', const Color.fromARGB(255, 70, 48, 16), context),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Sección de 'Cómo funciona HeyGift'
                  _buildHowItWorksSection(),
                  SizedBox(height: 20),
                  // Tarjetas de promociones
                  Text(
                    'Ten tu regalo listo para',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildPromoCard('San Valentín', '14 de Febrero', 'assets/images/udabol.jpg'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildPromoCard('Día de las Madres', '27 de Mayo', 'assets/images/utepsa.jpg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _buildPromoDiscountCard(),
                  SizedBox(height: 20),
                  // Emprendimientos de Mujeres
                  _buildSectionTitle('Emprendimientos de Mujeres', 'Ver todos'),
                  SizedBox(height: 10),
                  _buildHorizontalCards([
                    _buildBusinessCard('ArteCampo', 'Categoría: Hogar', 'assets/images/utepsa.jpg', 4.8, 50),
                    _buildBusinessCard('Mistú', 'Categoría: Belleza', 'assets/images/utepsa.jpg', 4.7, 60),
                  ]),
                  SizedBox(height: 20),
                ],
              ),
            ),
            
            Container(
              width: double.infinity,
              color: Color.fromRGBO(74, 24, 71, 1.0),
              padding: EdgeInsets.all(10.0), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Los más buscados del mes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  _buildHorizontalCards([
                    _buildBusinessCard('Multicenter', 'Categoría: Hogar', 'assets/images/utepsa.jpg', 4.6, 100),
                    _buildBusinessCard('MAC', 'Categoría: Cosméticos', 'assets/images/utepsa.jpg', 4.9, 200),
                  ]),
                ],
              ),
            ),
            
            // Tus tiendas favoritas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Tus tiendas favoritas', ''),
                  SizedBox(height: 10),
                  _buildHorizontalCards([
                    _buildFavoriteStoreCard('Yogen Früz', 'assets/images/udabol.jpg'),
                    _buildFavoriteStoreCard('Tauro Joyería', 'assets/images/udabol.jpg'),
                    _buildFavoriteStoreCard('Cine Center', 'assets/images/udabol.jpg'),
                    _buildFavoriteStoreCard('Yogen Früz', 'assets/images/udabol.jpg'),
                    _buildFavoriteStoreCard('Tauro Joyería', 'assets/images/udabol.jpg'),
                    _buildFavoriteStoreCard('Cine Center', 'assets/images/udabol.jpg'),
                  ]),
                ],
              ),
            ),
            
            // Tiendas con mejores ofertas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Tiendas con mejores ofertas', ''),
                  SizedBox(height: 10),
                  _buildHorizontalCards([
                    _buildStoreOfferCard('Multicenter', 'assets/images/udabol.jpg', 'Hasta 20% DTO', 'Desde Bs. 100'),
                    _buildStoreOfferCard('MAC', 'assets/images/udabol.jpg', 'Hasta 20% DTO', 'Desde Bs. 50'),
                    _buildStoreOfferCard('Fair Play', 'assets/images/udabol.jpg', 'Hasta 30% DTO', 'Desde Bs. 150'),
                    _buildStoreOfferCard('Multicenter', 'assets/images/udabol.jpg', 'Hasta 20% DTO', 'Desde Bs. 100'),
                    _buildStoreOfferCard('MAC', 'assets/images/udabol.jpg', 'Hasta 20% DTO', 'Desde Bs. 50'),
                    _buildStoreOfferCard('Fair Play', 'assets/images/udabol.jpg', 'Hasta 30% DTO', 'Desde Bs. 150'),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
  // Función para crear una tarjeta de tienda favorita sin footer
  Widget _buildFavoriteStoreCard(String title, String imagePath) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey), // Borde gris
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.2))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Bordes redondeados para la imagen
        child: Image.asset(
          imagePath,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Función para crear una tarjeta de tienda con oferta (con footer amarillo y gris)
  Widget _buildStoreOfferCard(String title, String imagePath, String discount, String price) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // Aplica borde redondeado a todo el contenedor
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen de la tienda con borde redondeado
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)), // Borde redondeado solo en la parte superior
            child: Image.asset(
              imagePath,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Contenedor amarillo para el descuento
          Container(
            width: double.infinity,
            color: Colors.yellow[700],
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              discount,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          // Contenedor gris para el precio
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300], // Color plomo
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)), // Borde redondeado solo en la parte inferior
            ),
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              price,
              style: TextStyle(fontSize: 10, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }




  // Función para crear una tarjeta de categoría
  // Función para crear una tarjeta de categoría con navegación
  Widget _buildCategoryCard(String title, String imagePath, Color backgroundColor, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'Deporte') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BrandsScreen()));
        } else if (title == 'Moda') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BrandsScreen()));
        } else if (title == 'Hogar') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BrandsScreen()));
        } else if (title == 'Restaurantes') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BrandsScreen()));
        } else if (title == 'Cosméticos') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BrandsScreen()));
        } else if (title == 'Entretenimiento') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BrandsScreen()));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                imagePath,
                height: 60,
                width: 60,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para crear la sección de 'Cómo funciona HeyGift'
  Widget _buildHowItWorksSection() {
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
          SizedBox(height: 40),
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
          width: 102,
          height: 100,
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          top: -20,
          left: 20,
          right: 20,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(icon, size: 20, color: Color(0xFF512B7A)),
          ),
        ),
      ],
    );
  }

  // Función para crear las flechas entre los pasos
  Widget _buildArrowIcon() {
    return Icon(Icons.arrow_forward, color: Color(0xFF512B7A), size: 20);
  }

  // Función para crear tarjetas de promociones
  Widget _buildPromoCard(String title, String subtitle, String imagePath, {bool isLarge = false}) {
    return Container(
      width: double.infinity,
      height: isLarge ? 150 : 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.8),
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.8),
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Nueva función para crear la tarjeta de descuento
  Widget _buildPromoDiscountCard() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/panaderia.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Descuento desde',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.8),
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            '20% con la compra de Gift Card\nde Bs. 100 o un valor mayor',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.8),
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Función para crear la sección de títulos con botón
  Widget _buildSectionTitle(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          actionText,
          style: TextStyle(fontSize: 14, color: Colors.blue),
        ),
      ],
    );
  }

  // Función para crear una tarjeta de negocio
  Widget _buildBusinessCard(String title, String category, String imagePath, double rating, int price) {
    return Container(
      width: 280,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 217, 217, 217),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.2))],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen superior
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(imagePath, height: 150, width: double.infinity, fit: BoxFit.cover),
              ),
              // Información de la empresa
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icono de la empresa
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/icons/Hogar.png',
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8),
                    // Texto de título, categoría y precio
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            category,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Gift Cards desde Bs. $price',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8), // Espaciado al final del card
            ],
          ),
          // Rating en la esquina superior derecha
          Positioned(
            bottom: 50,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.5))],
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[700], size: 16),
                  SizedBox(width: 2),
                  Text(
                    '$rating',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Función para construir las tarjetas horizontales
  Widget _buildHorizontalCards(List<Widget> cards) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: cards),
    );
  }
}
