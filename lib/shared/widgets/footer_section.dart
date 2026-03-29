import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      color: const Color(0xFF083A52),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60, // 🔥 menos padding en móvil
        vertical: 50,
      ),
      child: Column(
        children: [
          /// 🔥 CONTENIDO PRINCIPAL RESPONSIVE
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLogoSection(),
                    const SizedBox(height: 30),

                    _buildLinksSection(context),
                    const SizedBox(height: 30),

                    _buildServicesSection(context),
                    const SizedBox(height: 30),

                    _buildContactSection(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildLogoSection()),
                    const SizedBox(width: 40),
                    Expanded(flex: 2, child: _buildLinksSection(context)),
                    Expanded(flex: 2, child: _buildServicesSection(context)),
                    Expanded(flex: 3, child: _buildContactSection()),
                  ],
                ),

          const Divider(color: Colors.white24, height: 40),

          /// 🔥 PARTE INFERIOR RESPONSIVE
          isMobile
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    const SizedBox(height: 15),
                    Text(
                      "© ${DateTime.now().year} OCEANCOMEX. Todos los derechos reservados.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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

  /// 🔵 SECCIONES MODULARES

  Widget _buildLogoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildLinksSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "ENLACES RÁPIDOS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildFooterLink(context, "Inicio", '/'),
        _buildFooterLink(context, "Servicios", '/services'),
        _buildFooterLink(context, "Propuesta de Valor", '/propuestavalor'),
        _buildFooterLink(context, "Contacto", '/contact'),
      ],
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "SERVICIOS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildFooterLink(context, "Sector Pesca", '/sectorpesca'),
        _buildFooterLink(context, "Sector Procurement", '/sectorprocurement'),
        _buildFooterLink(context, "Sector Comercio Exterior", '/sectorcomext'),
      ],
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "CONTACTO",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildContactItem(Icons.location_on, "Manta, Ecuador"),
        _buildContactItem(Icons.phone, "+593 959119599"),
        _buildContactItem(Icons.email, "comercial@oceancomex.com"),
        _buildContactItem(Icons.access_time, "Lun - Vie: 8:00 - 17:30"),
      ],
    );
  }

  Widget _buildFooterLink(BuildContext context, String text, String route) {
    return InkWell(
      onTap: () => context.go(route),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
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
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }
}
