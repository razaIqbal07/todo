import 'package:flutter/material.dart';
import 'package:todo/widgets/AppBarWidget.dart';
import 'package:todo/widgets/CategoriesSlider.dart';

class Todos extends StatefulWidget {
  @override
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: Text(
          'Todos',
          style: TextStyle(
            color: Color(0xFF333333),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CategoriesSlider(),
          ],
        ),
      ),
    );
  }
}
