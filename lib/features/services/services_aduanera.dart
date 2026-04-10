import 'package:flutter/material.dart';
import 'package:oceancomex_web/shared/widgets/footer_section.dart';
import 'package:oceancomex_web/shared/widgets/main_header.dart';

class ServicesAduanera extends StatelessWidget {
  const ServicesAduanera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainHeader(),

            /// 🔵 HERO SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              color: const Color(0xFF0A2A43),
              child: Column(
                children: const [
                  Text(
                    'Gestión Aduanera',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Soluciones especializadas en procesos y normativa aduanera',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            /// 🔵 TARJETA PRINCIPAL
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
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    /// 🔹 TÍTULO
                    const Text(
                      'SERVICIOS DE GESTIÓN ADUANERA',
                      style: TextStyle(
                        fontSize: 24,
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

                    const SizedBox(height: 40),

                    /// 📌 SECCIÓN 1
                    _buildSectionHeader(
                      icon: Icons.account_balance,
                      title: 'Asesoría en Gestión Aduanera',
                    ),
                    const SizedBox(height: 16),
                    _buildBulletItem('Asesoría especializada en procesos de importación y exportación'),
                    _buildBulletItem('Análisis de cumplimiento normativo en operaciones aduaneras'),

                    const SizedBox(height: 30),

                    /// 📌 SECCIÓN 2
                    _buildSectionHeader(
                      icon: Icons.settings,
                      title: 'Regímenes Aduaneros Especiales',
                    ),
                    const SizedBox(height: 16),
                    _buildBulletItem('ZEDES (Zonas Especiales de Desarrollo Económico)'),
                    _buildBulletItem('Admisión Temporal'),
                    _buildBulletItem('Depósitos Aduaneros'),
                    _buildBulletItem('Otros regímenes de importación y exportación'),

                    const SizedBox(height: 30),

                    /// 📌 SECCIÓN 3
                    _buildSectionHeader(
                      icon: Icons.local_shipping,
                      title: 'Despacho Aduanero',
                    ),
                    const SizedBox(height: 16),
                    
                    _buildBulletItem('Agenciamiento aduanero'),

                    const SizedBox(height: 40),

                    /// 🔘 BOTÓN
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
                          // puedes usar context.go('/contact');
                        },
                        child: const Text(
                          'Solicitar información',
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
            FooterSection()
          ],
        ),
      ),
    );
  }

  /// 🔹 Bullet
  Widget _buildBulletItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFFFDE59),
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                height: 1.4,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Header
  Widget _buildSectionHeader({required IconData icon, required String title}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFDE59),
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
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A2A43),
            ),
          ),
        ),
      ],
    );
  }
}