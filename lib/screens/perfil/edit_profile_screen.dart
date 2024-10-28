import 'package:flutter/material.dart';
import 'package:heygift_app_frontend/components/CustomBottomNavigationBar.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Editar perfil',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Sin sombra
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              // Imagen de perfil editable
              GestureDetector(
                onTap: () {
                  // Aquí puedes añadir la lógica para cambiar la foto de perfil
                },
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo2.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Cambiar foto de perfil',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Campos de edición de perfil con estilo
              _buildTextField('Nombre'),
              _buildTextField('Apellido'),
              _buildTextField('Usuario'),
              _buildTextField('Celular'),
              _buildTextField('Email'),
              _buildTextField('Fecha de nacimiento', hint: 'DD/MM/AAAA'),
              SizedBox(height: 20),
              // Botón de guardar con todo el ancho
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(74, 24, 71, 1.0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bordes redondeados
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15), // Altura del botón
                  ),
                  onPressed: () {
                    // Lógica para guardar la información
                  },
                  child: Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  // Función para construir los campos de texto con estilo
  Widget _buildTextField(String label, {String hint = ''}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Bordes redondeados
          ),
          filled: true,
          fillColor: Colors.grey[200], // Color de fondo del input
        ),
      ),
    );
  }
}
