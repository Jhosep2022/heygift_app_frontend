// lib/screens/qr_scanner/qr_scanner_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  final ImagePicker _picker = ImagePicker();

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController qrController) {
    setState(() {
      controller = qrController;
    });
    qrController.scannedDataStream.listen((scanData) {
      print('Código QR Escaneado: $scanData');
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      // Aquí puedes manejar la imagen seleccionada (procesarla o analizarla)
      print('Imagen seleccionada: ${imageFile.path}');
    } else {
      print('No se seleccionó ninguna imagen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de la cámara para escanear el QR
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          // Botón de atrás y título centrado
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Scanear',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Botones en la parte inferior
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botón "Mi código QR"
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      heroTag: "qrCodeButton",
                      backgroundColor: Colors.white.withOpacity(0.8),
                      child: Icon(Icons.qr_code, color: Colors.black),
                      onPressed: () {
                        // Acción para "Mi código QR"
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Mi código QR',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                // Botón "Subir imagen"
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      heroTag: "uploadButton",
                      backgroundColor: Colors.white.withOpacity(0.8),
                      child: Icon(Icons.upload, color: Colors.black),
                      onPressed: _pickImage, // Abre la galería para seleccionar una imagen
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Subir imagen',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
