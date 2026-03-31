import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// ITEM DE CONTACTO
Widget buildContactItem({
  required IconData icon,
  required String title,
  required String content,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFDE59).withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF0A2A43),
            size: 24,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A2A43),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                content,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// FUNCIÓN PARA ABRIR URL
Future<void> launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'No se pudo abrir $url';
  }
}

/// SECCIÓN DE MAPA
Widget buildMapSection() {
  return Container(
    width: double.infinity,
    height: 400,
    color: Colors.grey[300],
    child: Stack(
      fit: StackFit.expand,
      children: [
        // Aquí puedes integrar un mapa real (Google Maps, OpenStreetMap, etc.)
        Container(
          color: const Color(0xFF0A2A43).withOpacity(0.1),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.map,
                  size: 100,
                  color: Color(0xFF0A2A43),
                ),
                SizedBox(height: 20),
                Text(
                  'Guayaquil - Ecuador',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF0A2A43),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

/// DIÁLOGO DE ÉXITO
void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Mensaje enviado'),
        content: const Text(
          'Gracias por contactarnos. Te responderemos a la brevedad posible.'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}