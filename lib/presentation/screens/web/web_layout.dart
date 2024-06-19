import 'package:flutter/material.dart';
import 'package:netflix/presentation/screens/web/home/home_screen.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScreenHomeWeb(),
    );
  }
}
