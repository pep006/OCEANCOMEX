import 'package:flutter/material.dart';
import 'package:oceancomex_web/features/contact/contact_page.dart';
import 'package:oceancomex_web/shared/widgets/footer_section.dart';
import 'package:oceancomex_web/shared/widgets/main_header.dart';

class PropuestavalorPage extends StatelessWidget {
  const PropuestavalorPage({super.key});

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
                    'Propuesta de Valor',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Soluciones logísticas integrales adaptadas a tu negocio.',
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
                constraints: const BoxConstraints(maxWidth: 900),
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
                  
                    const SizedBox(height: 30),
                    
                    // Lista de características con viñetas
                    _buildFeatureItem(
                      'Integración total',
                      'un solo punto de contacto para todas las gestiones operativas, documentales y logísticas.',
                    ),
                    _buildFeatureItem(
                      'Experiencia sectorial',
                      'profundo conocimiento del marco regulatorio pesquero ecuatoriano e internacional.',
                    ),
                    _buildFeatureItem(
                      'Transparencia y eficiencia',
                      'trazabilidad total de cada operación.',
                    ),
                    _buildFeatureItem(
                      'Red estratégica',
                      'relaciones activas con autoridades, proveedores y flotas internacionales.',
                    ),
                    _buildFeatureItem(
                      'Soluciones personalizadas',
                      'adaptadas a cada cliente, tipo de embarcación o flujo comercial.',
                    ),
                    _buildFeatureItem(
                      'Relaciones institucionales y regulatorias',
                      'Representación técnica en inspecciones y auditorias oficiales por las autoridades de control, resolución de conflictos administrativos y gestiones de cumplimiento.',
                      isLast: true,
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Botón de acción
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFDE59),
                          foregroundColor: const Color(0xFF0A2A43),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
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
                          'Solicitar información',
                          style: TextStyle(
                            fontSize: 16,
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

  Widget _buildFeatureItem(String title, String description, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Viñeta decorativa
          Container(
            margin: const EdgeInsets.only(top: 6, right: 12),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFFFFDE59),
              shape: BoxShape.circle,
            ),
          ),
          // Texto
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A2A43),
                    ),
                  ),
                  TextSpan(
                    text: description,
                  ),
                ],
              ),
            ),
          ),
        ],
        
      ),
      
    );
    
  }
  
}