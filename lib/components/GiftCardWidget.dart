import 'package:flutter/material.dart';

class GiftCardWidget extends StatelessWidget {
  final String brandLogo;
  final String price;
  final Color footerColor;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  final bool showNext;
  final bool showPrevious;

  GiftCardWidget({
    required this.brandLogo,
    required this.price,
    this.footerColor = const Color(0xFF333333),
    this.onNext,
    this.onPrevious,
    this.showNext = true,
    this.showPrevious = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.symmetric(vertical: 8.0),
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
              brandLogo,
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
                color: footerColor,
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
                    'Bs. $price',
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
          if (showNext)
            Positioned(
              top: 70,
              right: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: onNext,
              ),
            ),
          if (showPrevious)
            Positioned(
              top: 70,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: onPrevious,
              ),
            ),
        ],
      ),
    );
  }
}
