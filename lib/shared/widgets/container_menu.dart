import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class ContainerMenu extends StatelessWidget {
  const ContainerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF083A52),
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NavItem(title: 'Inicio', route: '/'),
              NavItem(title: 'Nosotros', route: '/quienessomos'),
              NavItem(title: 'Propuesta de Valor', route: '/propuestavalor'),         
              NavItem(title: 'Servicios', route: '/services'),
              NavItem(title: 'Contacto', route: '/contact'),
            ],
          ),
          const SizedBox(height: 8),

          Text(
            '“Servicios logísticos integrales con tarifas competitivas y soluciones rápidas.”',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final String route;

  const NavItem({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: InkWell(
        onTap: () => context.go(route),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
