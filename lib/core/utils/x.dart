/*import 'package:flutter/material.dart';
import 'package:oceancomex_web/shared/widgets/footer_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:oceancomex_web/shared/widgets/main_header.dart';

class ContactPage extends StatelessWidget {
  
  const ContactPage({super.key});
  

  @override
  Widget build(BuildContext context) {
final nombreController = TextEditingController();
final correoController = TextEditingController();
final telefonoController = TextEditingController();
final asuntoController = TextEditingController();
final mensajeController = TextEditingController();
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainHeader(),
            
            /// 🔵 HERO SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              color: const Color(0xFF0A2A43),
              child: Column(
                children: const [
                  Text(
                    'Contáctanos',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Estamos aquí para ayudarte con tus necesidades logísticas',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            /// 📞 SECCIÓN DE CONTACTO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: isMobile
                    ? Column(
                        children: [
                          _buildContactInfo(),
                          const SizedBox(height: 40),
                          _buildContactForm(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildContactInfo()),
                          const SizedBox(width: 50),
                          Expanded(child: _buildContactForm()),
                        ],
                      ),
              ),
            ),

            const SizedBox(height: 60),

            /// 🗺️ MAPA (opcional)
            _buildMapSection(),

            const SizedBox(height: 60),

            const FooterSection()
          ],
        ),
      ),
    );
  }

  /// 📍 INFORMACIÓN DE CONTACTO
  Widget _buildContactInfo() {
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

          _buildContactItem(
            icon: Icons.location_on,
            title: 'Dirección',
            content: 'Av. Principal 123, Edificio OCEANCOMEX\nGuayaquil, Ecuador',
          ),
          
          _buildContactItem(
            icon: Icons.phone,
            title: 'Teléfonos',
            content: '+593 4 123 4567\n+593 9 8765 4321',
          ),
          
          _buildContactItem(
            icon: Icons.email,
            title: 'Correo Electrónico',
            content: 'info@oceancomex.com\nventas@oceancomex.com',
          ),
          
          _buildContactItem(
            icon: Icons.access_time,
            title: 'Horario de Atención',
            content: 'Lunes a Viernes: 8:00 AM - 6:00 PM\nSábados: 9:00 AM - 1:00 PM',
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
              _buildSocialButton(
                icon: Icons.facebook,
                color: const Color(0xFF1877F2),
                onTap: () => _launchURL('https://facebook.com/oceancomex'),
              ),
              const SizedBox(width: 15),
              _buildSocialButton(
                icon: Icons.camera_alt,
                color: const Color(0xFFE4405F),
                onTap: () => _launchURL('https://instagram.com/oceancomex'),
              ),
              const SizedBox(width: 15),
              _buildSocialButton(
                icon: Icons.business,
                color: const Color(0xFF0077B5),
                onTap: () => _launchURL('https://linkedin.com/company/oceancomex'),
              ),
              const SizedBox(width: 15),
              _buildSocialButton(
                icon: Icons.play_circle_filled,
                color: const Color(0xFFFF0000),
                onTap: () => _launchURL('https://youtube.com/oceancomex'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 📝 FORMULARIO DE CONTACTO
  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
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
            'Envíanos un mensaje',
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

          // Nombre
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nombre completo',
              hintText: 'Ingresa tu nombre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.person, color: Color(0xFF0A2A43)),
            ),
          ),
          const SizedBox(height: 20),

          // Email
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Correo electrónico',
              hintText: 'tucorreo@ejemplo.com',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.email, color: Color(0xFF0A2A43)),
            ),
          ),
          const SizedBox(height: 20),

          // Teléfono
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Teléfono',
              hintText: '+593 99 999 9999',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.phone, color: Color(0xFF0A2A43)),
            ),
          ),
          const SizedBox(height: 20),

          // Asunto
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Asunto',
              hintText: '¿Sobre qué quieres consultar?',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.subject, color: Color(0xFF0A2A43)),
            ),
          ),
          const SizedBox(height: 20),

          // Mensaje
          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Mensaje',
              hintText: 'Escribe tu mensaje aquí...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              alignLabelWithHint: true,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Icon(Icons.message, color: Color(0xFF0A2A43)),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Botón de enviar
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFDE59),
                foregroundColor: const Color(0xFF0A2A43),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              onPressed: () {
                
              },
              child: const Text(
                'Enviar mensaje',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🗺️ SECCIÓN DE MAPA
  Widget _buildMapSection() {
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
                    'Av. Principal 123, Guayaquil - Ecuador',
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

  /// 📦 ITEM DE CONTACTO
  Widget _buildContactItem({
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

  /// 🔘 BOTÓN DE RED SOCIAL
  Widget _buildSocialButton({
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

  /// 🌐 FUNCIÓN PARA ABRIR URL
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  /// ✅ DIÁLOGO DE ÉXITO
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
}*/