import 'package:flutter/material.dart';
import 'package:oceancomex_web/shared/widgets/Container_Menu.dart';

import 'package:oceancomex_web/shared/widgets/contact_section.dart';

import 'package:oceancomex_web/shared/widgets/logo_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xFFF2F2F2),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LogoSection(),
                    SizedBox(height: 20),
                    ContactSection(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [LogoSection(), ContactSection()],
                ),
        ),

        ContainerMenu(),
      ],
    );
  }
}
