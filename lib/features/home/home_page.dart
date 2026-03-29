import 'package:flutter/material.dart';
import 'package:oceancomex_web/shared/widgets/footer_section.dart';
import 'package:oceancomex_web/shared/widgets/home_slider.dart';
import 'package:oceancomex_web/shared/widgets/main_header.dart';
import 'package:oceancomex_web/shared/widgets/presentation_section.dart';
import 'package:oceancomex_web/shared/widgets/propuesta_section.dart';
import 'package:oceancomex_web/shared/widgets/servicios_sectionhome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// 🔵 Header + Menú
            const MainHeader(),

            /// 🔵 Slider principal
            const HomeSlider(),

            /// 🔵 Presentación corporativa
            SizedBox(height: isMobile ? 20 : 40),
            const PresentationSection(),

            /// 🔵 Servicios
            SizedBox(height: isMobile ? 20 : 40),
            const ServiciosSection(),

            /// 🔵 Propuesta de valor
            SizedBox(height: isMobile ? 20 : 40),
            const PropuestaSection(),

            /// 🔵 Footer
            SizedBox(height: isMobile ? 20 : 40),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}