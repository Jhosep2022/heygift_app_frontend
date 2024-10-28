import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';
import 'package:heygift_app_frontend/screens/perfil/legal_information_screen.dart';
import 'edit_profile_screen.dart';
import 'gift_preference_screen.dart';
import 'notifications_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Fondo de color con la imagen de perfil y decoración superior
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: Color.fromRGBO(74, 24, 71, 1.0),
                  height: 120,
                ),
                Positioned(
                  top: 60, // Ajusta esta posición para centrar la imagen entre los dos colores
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20), // Imagen cuadrada con bordes redondeados
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Isabella M.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '@isabella.10',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
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
                  _buildProfileOption(Icons.person, 'Información personal', context),
                  _buildProfileOption(Icons.card_giftcard, 'Preferencia de regalos', context),
                  SizedBox(height: 20),
                  _buildSectionTitle('Actividad'),
                  _buildProfileOption(Icons.account_balance_wallet, 'Billetera HeyGift', context),
                  _buildProfileOption(Icons.help_outline, 'Ayuda en línea', context),
                  SizedBox(height: 20),
                  _buildSectionTitle('Configuración'),
                  _buildProfileOption(Icons.notifications, 'Notificaciones', context),
                  _buildProfileOption(Icons.info_outline, 'Información legal', context),
                  _buildProfileOption(Icons.store, 'Registrar mi negocio', context),
                  _buildProfileOption(Icons.exit_to_app, 'Cerrar sesión', context, color: Colors.red),
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
  Widget _buildProfileOption(IconData icon, String title, BuildContext context, {Color color = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Navegación específica para "Información personal", "Preferencia de regalos", "Notificaciones" e "Información legal"
        if (title == 'Información personal') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfileScreen()),
          );
        } else if (title == 'Preferencia de regalos') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GiftPreferenceScreen()),
          );
        } else if (title == 'Notificaciones') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationsScreen()),
          );
        } else if (title == 'Información legal') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LegalInformationScreen()),
          );
        }
        // Aquí puedes añadir más lógica de navegación para otras opciones si es necesario
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
