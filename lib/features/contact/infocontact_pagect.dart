


 import 'package:flutter/material.dart';
import 'package:oceancomex_web/features/contact/functions_pagecontact.dart';





///  INFORMACIÓN DE CONTACTO
  Widget buildContactInfo() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Información de Contacto',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A2A43),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 80,
            height: 4,
            color: const Color(0xFFFFDE59),
          ),
          const SizedBox(height: 30),

          buildContactItem(
            icon: Icons.location_on,
            title: 'Dirección',
            content: 'Guayaquil-Manta, Ecuador',
          ),
          
          buildContactItem(
            icon: Icons.phone,
            title: 'Teléfonos',
            content: '+593 959119599',
          ),
          
          buildContactItem(
            icon: Icons.email,
            title: 'Correo Electrónico',
            content: 'comercial@oceancomex.com\nventas@oceancomex.com',
          ),
          
          buildContactItem(
            icon: Icons.access_time,
            title: 'Horario de Atención',
            content: '8:00 AM - 17:30 PM',
          ),

          const SizedBox(height: 30),

          /// REDES SOCIALES
          const Text(
            'Síguenos en:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A2A43),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              buildSocialButton(
                icon: Icons.facebook,
                color: const Color(0xFF1877F2),
                onTap: () => launchURL('https://facebook.com/oceancomex'),
              ),
              const SizedBox(width: 15),
              buildSocialButton(
                icon: Icons.camera_alt,
                color: const Color(0xFFE4405F),
                onTap: () => launchURL('https://instagram.com/oceancomex'),
              ),
              const SizedBox(width: 15),
              buildSocialButton(
                icon: Icons.business,
                color: const Color(0xFF0077B5),
                onTap: () => launchURL('https://linkedin.com/company/oceancomex'),
              ),
              const SizedBox(width: 15),
              buildSocialButton(
                icon: Icons.play_circle_filled,
                color: const Color(0xFFFF0000),
                onTap: () => launchURL('https://youtube.com/oceancomex'),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
    
  ///  BOTÓN DE RED SOCIAL
  Widget buildSocialButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }




