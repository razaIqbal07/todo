import 'package:flutter/material.dart';

class CategoriesSlider extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .04,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category('Work'),
          Category('Personal'),
          Category('Personal'),
          Category('Personal'),
          Category('Personal'),
          Category('Personal'),
          Category('Personal'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String category;
  const Category(this.category);
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.indigo)
          // color: Colors.blue,
          ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          this.category,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
