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
    return Scaffold(
      body: Column(
        children: [
          MainHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: HomeSlider()),
                  const SizedBox(height: 20),
                  PresentationSection(),
                  const SizedBox(height: 20),
                  ServiciosSection(),
                  const SizedBox(height: 20),
                  PropuestaSection(),
                  const SizedBox(height: 20),
                  FooterSection()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
