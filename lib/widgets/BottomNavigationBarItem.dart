import 'package:flutter/material.dart';

class BottomNavigationBarItemWidget {
  final IconData icon;
  final String label;

  const BottomNavigationBarItemWidget({Key key, this.icon, this.label});

  BottomNavigationBarItem widget() {
    return BottomNavigationBarItem(
        icon: Icon(
          this.icon,
          size: 18,
        ),
        label: this.label);
  }
}
