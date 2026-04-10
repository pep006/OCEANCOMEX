import 'package:flutter/material.dart';
import 'package:oceancomex_web/shared/widgets/footer_section.dart';
import 'package:oceancomex_web/shared/widgets/main_header.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:go_router/go_router.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

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
                    'Nuestros Servicios',
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
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            /// 🔵 GRID DE SERVICIOS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  ServiceCard(
                    title: 'Sector Procurement',
                    description:
                        '• Proceso estratégico enfocado en la planificación, adquisición y gestión eficiente de bienes y servicios.',
                     
                    icon: Icons.handshake,
                    isMobile: isMobile,
                    route: '/sectorprocurement',
                  ),
                  ServiceCard(
                    title: 'Sector Comercio Exterior',
                    description:
                        '• Conjunto de operaciones que permiten el intercambio de bienes y servicios entre países.\n',
                    icon: Icons.directions_boat,
                    isMobile: isMobile,
                    route: '/sectorcomext',
                  ),
                  ServiceCard(
                    title: 'Sector Pesca',
                    description:
                        'Actividad económica orientada a la captura, procesamiento y comercialización de recursos marinos.',
                    icon: Icons.set_meal,
                    isMobile: isMobile,
                    route: '/sectorpesca',
                  ),
                  ServiceCard(
                    title: 'Gestión Aduanera',
                    description: 'Proceso encargado de regular y controlar el ingreso y salida de mercancías conforme a la normativa vigente.',
                    icon: Icons.description,
                    isMobile: isMobile,
                    route: '/aduanera',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isMobile;
  final String route;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.isMobile,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? double.infinity : 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.withValues(alpha: 0.5),
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 50, color: const Color(0xFF0A2A43)),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(fontSize: 15, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              context.go(route);
            },
            child: const Text('Más información'),
          ),
        ],
      ),
    );
  }
}
