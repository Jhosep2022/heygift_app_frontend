// lib/screens/connect/connect_tab_screen.dart
import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';

import 'qr_scanner_screen.dart';

class ConnectTabScreen extends StatefulWidget {
  @override
  _ConnectTabScreenState createState() => _ConnectTabScreenState();
}

class _ConnectTabScreenState extends State<ConnectTabScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
          IconButton(
            icon: Icon(Icons.qr_code, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRScannerScreen()),
              );
            },
          ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color.fromARGB(255, 96, 23, 109),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'Descubrir'),
            Tab(text: 'Solicitudes'),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDiscoverTab(),
          _buildRequestsTab(),
        ],
      ),
    );
  }

  Widget _buildDiscoverTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
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
          Row(
            children: [
              Icon(Icons.wechat_sharp, color: Colors.green, size: 60),
              SizedBox(width: 10),
              Expanded(
                child: Text('Contactos', style: TextStyle(fontSize: 16)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 96, 23, 109),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Buscar',
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
                Icon(Icons.facebook, color: Colors.blue, size: 60),
              SizedBox(width: 10),
              Expanded(
                child: Text('Facebook', style: TextStyle(fontSize: 16)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 96, 23, 109),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Buscar',
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.link, color: Colors.blueAccent, size: 60),
              SizedBox(width: 10),
              Expanded(
                child: Text('Invitar amigos', style: TextStyle(fontSize: 16)),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
          SizedBox(height: 20),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Sugerencias', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSuggestedContact('Martha Rojas', 'Amigos en común', 'assets/images/images.jpeg'),
                _buildSuggestedContact('Juan Camilo', 'Amigos en común', 'assets/images/images.jpeg'),
                _buildSuggestedContact('Penelope Perez', 'Amigos en común', 'assets/images/images.jpeg'),
                _buildSuggestedContact('Martha Rojas', 'Amigos en común', 'assets/images/images.jpeg'),
                _buildSuggestedContact('Juan Camilo', 'Amigos en común', 'assets/images/images.jpeg'),
                _buildSuggestedContact('Penelope Perez', 'Amigos en común', 'assets/images/images.jpeg'),
                _buildSuggestedContact('Martha Rojas', 'Amigos en común', 'assets/images/images.jpeg'),
                _buildSuggestedContact('Juan Camilo', 'Amigos en común', 'assets/images/images.jpeg'),
                _buildSuggestedContact('Penelope Perez', 'Amigos en común', 'assets/images/images.jpeg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestsTab() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        _buildRequestContact('Juan Camilo', 'Amigos en común', 'assets/images/images.jpeg'),
        _buildRequestContact('Rosa Perez', 'Amigos en común', 'assets/images/images.jpeg'),
        _buildRequestContact('Milenka Jimenez', 'Amigos en común', 'assets/images/images.jpeg'),
        _buildRequestContact('Julian Jordan', 'Amigos en común', 'assets/images/images.jpeg'),
        _buildRequestContact('Juan Camilo', 'Amigos en común', 'assets/images/images.jpeg'),
        _buildRequestContact('Rosa Perez', 'Amigos en común', 'assets/images/images.jpeg'),
        _buildRequestContact('Milenka Jimenez', 'Amigos en común', 'assets/images/images.jpeg'),
        _buildRequestContact('Julian Jordan', 'Amigos en común', 'assets/images/images.jpeg'),
      ],
    );
  }

  Widget _buildSuggestedContact(String name, String subtitle, String image) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 24,
      ),
      title: Text(name),
      subtitle: Text(subtitle),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 96, 23, 109),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          'Conectar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildRequestContact(String name, String subtitle, String image) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 28,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 96, 23, 109),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    'Conectar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
