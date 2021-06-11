import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final Widget title;

  const AppBarWidget({Key key, this.title});

  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: this.title,
      backgroundColor: Colors.white,
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      // ),
    );
  }
}
