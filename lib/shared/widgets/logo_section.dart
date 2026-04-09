import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/'); 
           
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