import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.push('/'); 
           
          },
          child: Image.asset(
            'assets/images/logo_oceancomex.png',
            height: 60,
          ),
        ),
      ],
    );
  }
}