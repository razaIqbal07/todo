import 'dart:ui';

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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.white70),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CategoriesSlider(),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Todo();
                })
          ],
        ),
      ),
    );
  }
}

class Todo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Icon(Icons.radio_button_off),
        title: Text('Tdod'),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
    // Container(
    //   width: MediaQuery.of(context).size.width,
    //   decoration: BoxDecoration(
    //       color: Colors.red, borderRadius: BorderRadius.circular(5)),
    //   margin: EdgeInsets.only(bottom: 10),
    //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    //   child: Text("ok"),
    // );
  }
}
