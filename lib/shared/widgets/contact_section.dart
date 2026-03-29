import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40,
      runSpacing: 15,
      alignment: WrapAlignment.center,
      children: [
      
        ContactItem(
          icon: Image.asset('assets/images/correo.png'),
          title: 'Email',
          subtitle: 'comercial@oceancomex.com.ec',
        ),
        ContactItem(
          icon: Image.asset('assets/images/ubi.png'),
          title: 'Dirección',
          subtitle: 'Manta-Ecuador',
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
           backgroundColor: const Color(0xFFFFDE59),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed:  _openWhatsApp,
          icon: const Icon(Icons.call, color: Colors.black),
          label: const Text(
            '¡Conversemos!',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class ContactItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;

  const ContactItem({super.key, 
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          radius: 22,
          child: icon,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(subtitle, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      ],
    );
  }
}


//abrir whatsapp

Future<void> _openWhatsApp() async {

  
  final Uri url = Uri.parse(
    'https://wa.me/593959119599?text=Hola%20quiero%20información',
  );

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('No se pudo abrir WhatsApp');
  }
}