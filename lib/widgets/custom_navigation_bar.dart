import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.map),
        label: 'Mapa'),
      BottomNavigationBarItem(
        icon: Icon(Icons.directions),
        label: 'Direcciones'),
      ]);
  }
}