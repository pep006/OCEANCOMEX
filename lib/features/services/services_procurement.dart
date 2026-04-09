import 'package:flutter/material.dart';
import 'package:oceancomex_web/features/contact/contact_page.dart';
import 'package:oceancomex_web/shared/widgets/footer_section.dart';
import 'package:oceancomex_web/shared/widgets/main_header.dart';

class ServicesProcurement extends StatelessWidget {
  const ServicesProcurement({super.key});

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
                    'Sector Procurement',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Soluciones integrales de aprovisionamiento y compras para tu empresa',
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

            /// 🔵 TARJETA DE SERVICIOS
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
                      'SERVICIOS DE PROCUREMENT',
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
                    const SizedBox(height: 40),

                    /// 📌 SECCIÓN: SERVICIOS DE PROCUREMENT
                    _buildSectionHeader(
                      icon: Icons.shopping_cart,
                      title: 'Nuestros Servicios',
                    ),
                    const SizedBox(height: 20),
                    
                    // Grid de 4 servicios en 2 columnas
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 3,
                      children: [
                        _buildProcurementCard(
                          'Búsqueda de proveedores',
                          Icons.search,
                        ),
                        _buildProcurementCard(
                          'Solicitud de cotizaciones',
                          Icons.request_quote,
                        ),
                        _buildProcurementCard(
                          'Verificación de proveedores',
                          Icons.verified,
                        ),
                        _buildProcurementCard(
                          'Asistencia en compras',
                          Icons.shopping_bag,
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),

                    // Sección: Beneficios
                    const Text(
                      'Beneficios',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A2A43),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    _buildBenefitItem(
                      'Ahorro de tiempo y recursos',
                      'Optimizamos tus procesos de búsqueda y selección de proveedores',
                    ),
                    _buildBenefitItem(
                      'Proveedores verificados',
                      'Validamos la solvencia y confiabilidad de cada proveedor',
                    ),
                    _buildBenefitItem(
                      'Mejores condiciones',
                      'Negociamos precios competitivos y condiciones favorables',
                    ),
                    _buildBenefitItem(
                      'Acompañamiento integral',
                      'Te asistimos durante todo el proceso de compra',
                    ),

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

  /// Widget para las tarjetas de Procurement
  Widget _buildProcurementCard(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(8, 10, 42, 67),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
           color: Color.fromARGB(77, 255, 222, 89),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color.fromARGB(51, 255, 222, 89),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF0A2A43),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0A2A43),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget para items de beneficios
  Widget _buildBenefitItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, right: 12),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFFFFDE59),
              shape: BoxShape.circle,
            ),
          ),
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
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A2A43),
            ),
          ),
        ),
      ],
    );
  }
}