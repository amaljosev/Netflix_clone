import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBarMob(bool isAppBarBottomVisible, BuildContext context) {
  final size = MediaQuery.of(context).size;
  return AppBar(
    title: Text(
      'N',
      style: GoogleFonts.bebasNeue(
        color: Colors.red.shade600,
        fontSize: 50,
      ),
    ),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
    ],
    bottom: isAppBarBottomVisible
        ? PreferredSize(
            preferredSize: const Size.fromHeight(45.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('TV Shows'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Movies'),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text('Categories'),
                        Icon(Icons.keyboard_arrow_down_outlined),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : null,
  );
}
