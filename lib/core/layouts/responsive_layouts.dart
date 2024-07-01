import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
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
  late StreamSubscription internetSub;

  bool isConnected = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesBloc>(context).add(GetMoviesEvent());
    internetSub = InternetConnection().onStatusChange.listen(
      (event) {
        switch (event) {
          case InternetStatus.connected:
            setState(() {
              isConnected = true;
            });
            break;
          case InternetStatus.disconnected:
            setState(() {
              isConnected = false;
            });

            break;
          default:
            setState(() {
              isConnected = false;
            });

            break;
        }
      },
    );
  }

  @override
  void dispose() {
    internetSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isConnected) {
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
    } else {
      return Container(
            color: Colors.grey.shade800,
            child: const Center(
              child: Icon(Icons.wifi_off),
            ),
          );
    }
  }
}
