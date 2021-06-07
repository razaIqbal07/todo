import 'package:flutter/material.dart';
import 'package:todo/screens/AddTodo.dart';
import 'package:todo/screens/Todos.dart';
import 'package:todo/widgets/AppBarWidget.dart';
import 'package:todo/widgets/BottomNavigationBar.dart';
import 'package:todo/widgets/BottomNavigationBarItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => Home(), '/addTodo': (context) => AddTodo()},
      theme: ThemeData(
          primaryIconTheme: IconThemeData(color: Colors.black),
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.indigo))),
      // home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [Todos(), Text('second screen')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItemWidget(
            icon: Icons.featured_play_list,
            label: 'Tasks',
          ).widget(),
          BottomNavigationBarItemWidget(
            icon: Icons.calendar_today_rounded,
            label: 'Calendar',
          ).widget(),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
