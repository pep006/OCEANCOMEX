import 'package:flutter/material.dart';
import 'package:oceancomex_web/features/contact/contact_page.dart';
import 'package:oceancomex_web/shared/widgets/footer_section.dart';
import 'package:oceancomex_web/shared/widgets/main_header.dart';

class QuienessomosPage extends StatelessWidget {
  const QuienessomosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainHeader(),

            /// HERO SECTION
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/quienessomosimg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 80,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.7),
                      Colors.black.withValues(alpha: 0.3),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  children: const [
                    Text(
                      'Sobre Nosotros',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Operador logístico integral especializado en comercio internacional y sector pesquero',
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 60),

            /// CONTENIDO PRINCIPAL
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 1100),
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.grey.withValues(alpha: 0.1),
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// SOBRE NOSOTROS
                    _buildSectionHeader(
                      icon: Icons.business,
                      title: 'Sobre Nosotros',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Somos un operador logístico integral y freight forwarder, '
                      'especializado en transporte multimodal, gestión aduanera y '
                      'asesoría regulatoria para empresas que participan en el '
                      'comercio internacional y en la industria pesquera.\n\n'
                      'Desde Manta – Ecuador, uno de los principales puertos '
                      'comerciales del país, coordinamos operaciones logísticas y '
                      'documentales que permiten a nuestros clientes optimizar sus '
                      'procesos y expandir sus negocios hacia nuevos mercados.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// MISIÓN
                    _buildSectionHeader(icon: Icons.flag, title: 'Misión'),
                    const SizedBox(height: 16),
                    const Text(
                      'Ofrecer soluciones integrales en comercio exterior y '
                      'logística internacional, garantizando eficiencia operativa, '
                      'cumplimiento normativo y acompañamiento profesional en cada '
                      'operación.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// VISIÓN
                    _buildSectionHeader(
                      icon: Icons.visibility,
                      title: 'Visión',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Ser una empresa referente en comercio exterior y logística '
                      'especializada, reconocida por su confiabilidad, eficiencia y '
                      'capacidad de generar valor en cada operación internacional.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// BOTÓN
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFDE59),
                          foregroundColor: const Color(0xFF0A2A43),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ContactPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Contáctanos',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 80),
            FooterSection(),
          ],
        ),
      ),
    );
  }

  /// 🔥 HEADER CENTRADO (LA CLAVE)
  Widget _buildSectionHeader({required IconData icon, required String title}) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFDE59),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF0A2A43), size: 24),
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A2A43),
            ),
          ),
        ],
      ),
    );
  }
}
