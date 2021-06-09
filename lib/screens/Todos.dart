import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo/widgets/AppBarWidget.dart';
import 'package:todo/widgets/CategoriesSlider.dart';

class Todos extends StatefulWidget {
  @override
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  bool fabExpanded = false;

  void _handleFabClick() {
    setState(() {
      fabExpanded = !fabExpanded;
    });
  }

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
      drawer: Drawer(
        child: Container(),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedSwitcher(
            child: fabExpanded
                ? Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/addTodo');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Text('Add Todo'),
                            ),
                            IconButton(
                              color: Colors.pink,
                              icon: Icon(
                                Icons.add,
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/manageCategories');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Text('Add Category'),
                            ),
                            IconButton(
                              color: Colors.pink,
                              icon: Icon(
                                Icons.add,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : SizedBox(),
            duration: Duration(milliseconds: 200),
            switchInCurve: Curves.fastOutSlowIn,
          ),
          FloatingActionButton(
              backgroundColor: fabExpanded ? Colors.pink.shade300 : null,
              onPressed: _handleFabClick,
              child: AnimatedSwitcher(
                  child: fabExpanded
                      ? Icon(
                          Icons.close,
                        )
                      : Icon(
                          Icons.add,
                        ),
                  duration: Duration(milliseconds: 300)))
        ],
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
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
