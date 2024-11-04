import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';
import 'package:heygift_app_frontend/components/GiftCardWidget.dart';

import 'customize_gift_card_screen.dart';

class BrandDetailScreen extends StatefulWidget {
  final String brandName;
  final String category;
  final String description;
  final String imagePath;
  final List<String> galleryImages;

  BrandDetailScreen({
    required this.brandName,
    required this.category,
    required this.description,
    required this.imagePath,
    required this.galleryImages,
  });

  @override
  _BrandDetailScreenState createState() => _BrandDetailScreenState();
}

class _BrandDetailScreenState extends State<BrandDetailScreen> {
  bool isFavorite = false;
  int currentPriceIndex = 0;
  final List<double> prices = [50.0, 100.0, 150.0];

  void _nextPrice() {
    if (currentPriceIndex < prices.length - 1) {
      setState(() {
        currentPriceIndex++;
      });
    }
  }

  void _previousPrice() {
    if (currentPriceIndex > 0) {
      setState(() {
        currentPriceIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCustomHeader(context),
            SizedBox(height: 60),
            _buildFavoriteIcon(),
            _buildBrandInfo(),
            _buildDescription(),
            _buildGallery(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      '${widget.brandName} Giftcards',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  GiftCardWidget(
                    brandLogo: 'assets/images/panaderia.jpg',
                    price: prices[currentPriceIndex].toStringAsFixed(2),
                    onNext: _nextPrice,
                    onPrevious: _previousPrice,
                    showPrevious: currentPriceIndex > 0,
                    showNext: currentPriceIndex < prices.length - 1,
                  ),
                ],
              ),
            ),
            _buildActionButtons(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _buildCustomHeader(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          bottom: -40,
          left: MediaQuery.of(context).size.width / 2 - 50,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('assets/images/udabol.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFavoriteIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, right: 16.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.purple : Colors.grey,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
        ),
      ),
    );
  }

  Widget _buildBrandInfo() {
    return Center(
      child: Column(
        children: [
          Text(
            widget.brandName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.category,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        widget.description,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Colors.black54),
      ),
    );
  }

  Widget _buildGallery() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: widget.galleryImages
            .map((img) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        img,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Acción para comprar gift card
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
                'Comprar Giftcard',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomizeGiftCardScreen()),
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
                'Personaliza tu gift card',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
