import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Mapa para almacenar el estado de cada opción de notificación
  Map<String, bool> _notificationSettings = {
    'Promociones': true,
    'Cupones': false,
    'Recomendaciones': true,
    'Encuestas': false,
    'Recordatorios': true,
    'Novedades': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notificaciones',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _notificationSettings.keys.map((key) {
            return _buildNotificationOption(
              key,
              _getSubtitleForKey(key),
              _notificationSettings[key]!,
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  // Función para construir las opciones de notificación
  Widget _buildNotificationOption(String title, String subtitle, bool isEnabled) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Switch(
            value: isEnabled,
            activeColor: Color.fromRGBO(74, 24, 71, 1.0),
            onChanged: (bool value) {
              setState(() {
                _notificationSettings[title] = value;
              });
            },
          ),
        ],
      ),
    );
  }

  // Función para obtener el subtítulo correspondiente a cada notificación
  String _getSubtitleForKey(String key) {
    switch (key) {
      case 'Promociones':
        return 'Entérate de ofertas y promociones exclusivas para ti';
      case 'Cupones':
        return 'No te pierdas de descuentos, cupones ni beneficios exclusivos para ti';
      case 'Recomendaciones':
        return 'Recibe recomendaciones inspiradas en tus marcas favoritas';
      case 'Encuestas':
        return 'Opina sobre tu experiencia en la app y con tus gift cards';
      case 'Recordatorios':
        return 'Recibe recordatorios de fechas importantes y haz feliz a tus amigos';
      case 'Novedades':
        return 'Descubre nuevas secciones, funciones y novedades de HeyGift';
      default:
        return '';
    }
  }
}
