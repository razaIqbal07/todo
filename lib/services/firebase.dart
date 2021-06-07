import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  static createTodo() async {
    return await FirebaseFirestore.instance
        .collection('tasks')
        .add({'task': 'Attend meeting'});
  }
}
