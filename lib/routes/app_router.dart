import 'package:go_router/go_router.dart';
import 'package:oceancomex_web/features/about/propuestavalor_page.dart';
import 'package:oceancomex_web/features/contact/contact_page.dart';
import 'package:oceancomex_web/features/services/Services_pesca.dart';
import 'package:oceancomex_web/features/services/services_comext.dart';
import 'package:oceancomex_web/features/services/services_procurement.dart';
import 'package:oceancomex_web/shared/widgets/quienessomos_page.dart';
import '../features/home/home_page.dart';
import '../features/services/services_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  HomePage(),
    ),
    GoRoute(
      path: '/services',
      builder: (context, state) => const ServicesPage(),
    ),
    GoRoute(
      path: '/propuestavalor',
      builder: (context, state) => const PropuestavalorPage(),
    ),
    GoRoute(
      path: '/sectorpesca',
      builder: (context, state) => const ServicesPesca(),
    ),
    GoRoute(
      path: '/sectorprocurement',
      builder: (context, state) => const ServicesProcurement(),
    ),
     GoRoute(
      path: '/sectorcomext',
      builder: (context, state) => const ServicesComext(),
    ),
      GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactPage(),
    ),
    GoRoute(
      path: '/quienessomos',
      builder: (context, state) => const QuienessomosPage(),
    ),
  ],
);