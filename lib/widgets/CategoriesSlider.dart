import 'package:flutter/material.dart';

class CategoriesSlider extends StatelessWidget {
  int selectedCategory = 0;

  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .04,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 10,
          ),
          Category('All', true),
          Category('Work', false),
          Category('Personal', false),
          Category('Personal', false),
          Category('Personal', false),
          Category('Personal', false),
          Category('Personal', false),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String category;
  final bool isSelected;

  const Category(this.category, this.isSelected);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: Colors.indigo),
        color: isSelected ? Colors.indigo : Colors.white,
      ),
      child: isSelected
          ? Align(
              alignment: Alignment.center,
              child: Text(this.category,
                  style: TextStyle(
                    color: Colors.white,
                  )))
          : Align(
              alignment: Alignment.center,
              child: Text(
                this.category,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
    );
  }
}
