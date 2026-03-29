import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContainerMenu extends StatelessWidget {
  const ContainerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      color: const Color(0xFF083A52),
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 🔥 MENU RESPONSIVE
          isMobile
              ? Column(
                  children: const [
                    NavItem(title: 'Inicio', route: '/'),
                    NavItem(title: 'Nosotros', route: '/quienessomos'),
                    NavItem(
                      title: 'Propuesta de Valor',
                      route: '/propuestavalor',
                    ),
                    NavItem(title: 'Servicios', route: '/services'),
                    NavItem(title: 'Contacto', route: '/contact'),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    NavItem(title: 'Inicio', route: '/'),
                    NavItem(title: 'Nosotros', route: '/quienessomos'),
                    NavItem(
                      title: 'Propuesta de Valor',
                      route: '/propuestavalor',
                    ),
                    NavItem(title: 'Servicios', route: '/services'),
                    NavItem(title: 'Contacto', route: '/contact'),
                  ],
                ),

          const SizedBox(height: 8),

          /// 🔵 TEXTO
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '“Servicios logísticos integrales con tarifas competitivas y soluciones rápidas.”',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 14 : 18, // 🔥 más pequeño en móvil
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final String route;

  const NavItem({required this.title, required this.route, super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 10 : 25, // 🔥 menos espacio en móvil
        vertical: isMobile ? 8 : 0,
      ),
      child: InkWell(
        onTap: () => context.go(route),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
