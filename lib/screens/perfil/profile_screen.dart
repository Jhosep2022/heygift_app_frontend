import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Fondo de color con la imagen de perfil y decoración superior
            Stack(
              children: [
                Container(
                  color: Color.fromRGBO(74, 24, 71, 1.0),
                  height: 150,
                ),
                Positioned(
                  top: 70,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/logo2.jpg'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Isabella M.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '@isabella.10',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 70), // Espaciado después de la cabecera
            // Lista de opciones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Perfil'),
                  _buildProfileOption(Icons.person, 'Información personal'),
                  _buildProfileOption(Icons.card_giftcard, 'Preferencia de regalos'),
                  SizedBox(height: 20),
                  _buildSectionTitle('Actividad'),
                  _buildProfileOption(Icons.account_balance_wallet, 'Billetera HeyGift'),
                  _buildProfileOption(Icons.help_outline, 'Ayuda en línea'),
                  SizedBox(height: 20),
                  _buildSectionTitle('Configuración'),
                  _buildProfileOption(Icons.notifications, 'Notificaciones'),
                  _buildProfileOption(Icons.info_outline, 'Información legal'),
                  _buildProfileOption(Icons.store, 'Registrar mi negocio'),
                  _buildProfileOption(Icons.exit_to_app, 'Cerrar sesión', color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  // Función para construir cada opción en la lista de perfil
  Widget _buildProfileOption(IconData icon, String title, {Color color = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Aquí puedes añadir navegación o lógica de acción para cada opción
      },
    );
  }

  // Función para construir los títulos de sección
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
      ),
    );
  }
}
