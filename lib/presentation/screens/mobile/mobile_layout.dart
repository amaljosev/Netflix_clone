import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/screens/mobile/bloc/mobile_bloc.dart';
import 'package:netflix/presentation/screens/mobile/home/home_screen_mob.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MobileBloc(),
      child: const ScreenHomeMob(),
    );
  }
}
