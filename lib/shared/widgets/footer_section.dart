import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF083A52), // Color corporativo
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 50),
      child: Column(
        children: [
          // Primera fila: Logo + información + enlaces
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Columna 1: Logo y descripción
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFDE59),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              "OC",
                              style: TextStyle(
                                color: Color(0xFF083A52),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "OCEANCOMEX",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Operador integral en logística y comercio exterior, especializado en servicios de transporte multimodal para importación y exportación.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 40),
              
              // Columna 2: Enlaces rápidos
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "ENLACES RÁPIDOS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildFooterLink(context,"Inicio", '/'),
                    _buildFooterLink(context,"Servicios",'/services'),
                    _buildFooterLink(context,"Propuesta de Valor",'/propuestavalor'),
                    _buildFooterLink(context,"Contacto",'/contact'),
                  ],
                ),
              ),
              
              // Columna 3: Servicios
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "SERVICIOS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                   
                    _buildFooterLink(context, "Sector Pesca", '/sectorpesca'),
_buildFooterLink(context, "Sector Procurement", '/sectorprocurement'),
_buildFooterLink(context, "Sector Comercio Exterior", '/sectorcomext'),
                  ],
                ),
              ),
              
              // Columna 4: Contacto
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "CONTACTO",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildContactItem(Icons.location_on, "Manta, Ecuador"),
                    _buildContactItem(Icons.phone, "+593 959119599"),
                    _buildContactItem(Icons.email, "comercial@oceancomex.com"),
                    _buildContactItem(Icons.access_time, "Lun - Vie: 8:00 - 17:30"),
                  ],
                ),
              ),
            ],
          ),
          
          const Divider(color: Colors.white24, height: 40),
          
          // Segunda fila: Redes sociales y copyright
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Redes sociales
              Row(
                children: [
                  _buildSocialIcon(Icons.facebook),
                  const SizedBox(width: 15),
                  _buildSocialIcon(Icons.link),
                  const SizedBox(width: 15),
                  _buildSocialIcon(Icons.camera_alt),
                  const SizedBox(width: 15),
                  _buildSocialIcon(Icons.video_library),
                ],
              ),
              
              // Copyright
              Text(
                "© ${DateTime.now().year} OCEANCOMEX. Todos los derechos reservados.",
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(BuildContext context, String text, String route) {
  return InkWell(
    onTap: () {
      context.go(route); // 👈 ahora sí funciona
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    ),
  );
}

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 16),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return InkWell(
      onTap: () {
        // Abrir red social
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}