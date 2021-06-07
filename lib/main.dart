import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/AddTodo.dart';
import 'package:todo/screens/Todos.dart';
import 'package:todo/widgets/AppBarWidget.dart';
import 'package:todo/widgets/BottomNavigationBar.dart';
import 'package:todo/widgets/BottomNavigationBarItem.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [Todos(), Text('second screen')];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error);
          return Text('Error');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
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

        // Otherwise, show something whilst waiting for initialization to complete
        return Text('loadin');
      },
    );
  }
}
