import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final onTap;

  const BottomNavigationBarWidget({Key key, this.items, this.onTap});

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: 0,
      onTap: this.onTap,
      items: this.items,
      backgroundColor: Colors.white,
    );
  }
}
