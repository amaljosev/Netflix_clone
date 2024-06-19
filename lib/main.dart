import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/layouts/responsive_layouts.dart';
import 'package:netflix/presentation/screens/bloc/movies_bloc.dart';
import 'package:netflix/presentation/screens/web/home/home_screen.dart';
import 'package:netflix/presentation/screens/mobile/mobile_layout.dart';
import 'package:netflix/presentation/screens/tab/tab_layout.dart';
import 'package:netflix/presentation/screens/web/web_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(),
      child: MaterialApp(
        title: 'Netflix',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const ResponsiveLayout(
              mobileLayout: MobileLayout(),
              tabLayout: TabLayout(),
              webLayout: WebLayout()),
          '/home': (context) => const ScreenHomeWeb(),
        },
        initialRoute: '/',
      ),
    );
  }
}
