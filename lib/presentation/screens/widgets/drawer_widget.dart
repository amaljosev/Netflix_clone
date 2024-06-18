import 'package:flutter/material.dart';

drawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        const DrawerHeader(child: Icon(Icons.favorite)),
        const ListTile(
          title: Text('D A S H B O A R D'),
        ),
        ListTile(
          title: const Text('S E T T I N G S'),
          onTap: () => Navigator.pushNamed(context, 'settings'),
        ),
        ListTile(
          title: const Text('L O G O U T'),
          onTap: () => Navigator.pushNamed(context, 'login'),
        ),
      ],
    ),
  );
}