import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/screens/bloc/movies_bloc.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout(
      {super.key,
      required this.mobileLayout,
      required this.tabLayout,
      required this.webLayout});
  final Widget mobileLayout;
  final Widget tabLayout;
  final Widget webLayout;

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesBloc>(context).add(GetMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return widget.mobileLayout;
        } else if (constraints.maxWidth < 1100) {
          return widget.tabLayout;
        } else {
          return widget.webLayout;
        }
      },
    );
  }
}
