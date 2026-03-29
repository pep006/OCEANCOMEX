import 'dart:async';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
  ];

 @override
void initState() {
  super.initState();

  Timer.periodic(const Duration(seconds: 15), (Timer timer) {
    if (!_controller.hasClients) return; // 👈 SOLUCIÓN

    if (_currentPage < images.length - 1) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }

    _controller.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  });
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: PageView.builder(
        controller: _controller,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}