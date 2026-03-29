import 'package:flutter/material.dart';
import 'package:oceancomex_web/shared/widgets/footer_section.dart';
import 'package:oceancomex_web/shared/widgets/main_header.dart';

class ServicesPesca extends StatelessWidget {
  const ServicesPesca({super.key});

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
                    'Sector Pesca',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Soluciones logísticas integrales especializadas para la industria pesquera',
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

            /// 🔵 TARJETA DE PROPUESTA DE VALOR
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
                    // Título de la sección
                    const Text(
                      'SERVICIOS ESPECIALIZADOS PARA EL SECTOR PESCA',
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
                    
                    /// 📌 SECCIÓN 1: TRÁMITES DE ASOCIACIÓN
                    _buildSectionHeader(
                      icon: Icons.assignment,
                      title: 'Trámites de Asociación',
                    ),
                    const SizedBox(height: 16),
                    _buildBulletItem('Validación de documentos necesarios para asociación de bienes'),
                    _buildBulletItem('Seguimiento y control de Trámites de asociaciones de barcos, trámites con DIRNEA (renovaciones)'),

                    const SizedBox(height: 30),

                    /// 📌 SECCIÓN 2: MANEJO DOCUMENTAL PESQUERO
                    _buildSectionHeader(
                      icon: Icons.description,
                      title: 'Manejo Documental Pesquero para plantas o comercializadoras',
                    ),
                    const SizedBox(height: 16),
                    _buildBulletItem('Tramitación de permisos de pesca y zarpe'),
                    _buildBulletItem('Emisión y validación de documentos habilitantes'),
                    _buildBulletItem('Provisión y cierre de gastos de importación'),
                    _buildBulletItem('Coordinación de descarga'),
                    _buildBulletItem('AISV'),
                    _buildBulletItem('Trámites SIAP'),
                    _buildBulletItem('Habilitación de la pesca'),
                    _buildBulletItem('Análisis de regímenes aduaneros para ingreso de pesca'),
                    _buildBulletItem('Cierre de trámite con entidades de control'),
                    _buildBulletItem('Emisión de garantías aduaneras'),
                    
                    const SizedBox(height: 40),
                    
                    /// 📌 BOTÓN DE ACCIÓN
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
                          // Acción del botón
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

  /// Widget para items simples con viñeta (listas)
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

  /// Widget para encabezados de sección con icono
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