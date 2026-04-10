import 'package:flutter/material.dart';
import 'package:oceancomex_web/features/contact/contact_page.dart';
import 'package:oceancomex_web/shared/widgets/footer_section.dart';
import 'package:oceancomex_web/shared/widgets/main_header.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ServicesComext extends StatelessWidget {
  const ServicesComext({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

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
                    'Importaciones Y Exportaciones',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Soluciones integrales en comercio exterior adaptadas a tu negocio',
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

            /// 🔵 TARJETA DE SERVICIOS DETALLADOS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 1200),
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
                    /// Título
                    const Text(
                      'SERVICIOS DE COMERCIO EXTERIOR',
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

                    /// Grid de servicios en 2 columnas
                    isMobile
                        ? Column(
                            children: _buildServiceItems(),
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: _buildServiceItems().sublist(0, _buildServiceItems().length ~/ 2 + 1),
                                ),
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                child: Column(
                                  children: _buildServiceItems().sublist(_buildServiceItems().length ~/ 2 + 1),
                                ),
                              ),
                            ],
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

  List<Widget> _buildServiceItems() {
    return [
    
      _buildServiceItem(
        'Coordinación logística marítima, aérea y terrestre',
        Icons.directions_boat,
      ),
      _buildServiceItem(
        'Emisión, validación y legalización de documentos internacionales',
        Icons.assignment,
        subtitle: 'BL, COO, factura comercial, packing list, etc.',
      ),
      
      _buildServiceItem(
        'Control y seguimiento de embarques hasta destino final',
        Icons.track_changes,
      ),
      _buildServiceItem(
        'Transporte internacional y manejo de cargas',
        Icons.local_shipping,
        subtitle: 'FCL, LCL',
      ),
     
      _buildServiceItem(
        'Emisión de anexos compensatorios',
        Icons.request_page,
        subtitle: 'Control de inventarios aduaneros y vencimientos',
      ),
      _buildServiceItem(
        'Apertura y cierre de DAES',
        Icons.folder_open,
      ),
      _buildServiceItem(
        'Transporte local para cargas pesadas y livianas',
        Icons.local_shipping,
      ),
      _buildServiceItem(
        'Coordinación de almacenamiento de carga',
        Icons.warehouse,
        subtitle: 'Bodegas simples, régimen 70',
      ),
      _buildServiceItem(
        'Registro de Importador/Exportador',
        Icons.app_registration,
        subtitle: 'Token en el Ecuapass',
      ),
      _buildServiceItem(
        'Trámites de Licencias y permisos',
        Icons.verified,
        subtitle: 'INEN, ARCSA, SAE, MAGAP',
      ),
      _buildServiceItem(
        'Etiquetado',
        Icons.label,
      ),
      _buildServiceItem(
        'Clasificación arancelaria',
        Icons.category,
      ),
      _buildServiceItem(
        'Análisis de costeo',
        Icons.calculate,
        subtitle: 'Viabilidad según capital de inversión',
      ),
      _buildServiceItem(
        'Servicio de seguro de carga',
        Icons.security,
      ),
    ];
  }

  Widget _buildServiceItem(String title, IconData icon, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            child: Icon(
              icon,
              color: const Color(0xFFFFDE59),
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
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0A2A43),
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}