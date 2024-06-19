import 'package:flutter/material.dart';
import 'package:netflix/presentation/screens/tab/home/home_tab_screen.dart';

class TabLayout extends StatelessWidget {
  const TabLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:ScreenHomeTab() 
    );
  }
}