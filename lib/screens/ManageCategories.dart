import 'package:flutter/material.dart';
import 'package:todo/services/firebase.dart';
import 'package:todo/widgets/AppBarWidget.dart';

class ManageCategories extends StatefulWidget {
  @override
  _ManageCategoriesState createState() => _ManageCategoriesState();
}

class _ManageCategoriesState extends State<ManageCategories> {
  final _formKey = GlobalKey<FormState>();
  // String dropdownValue = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(Icons.note_add_rounded, size: 20),
              ),
              TextSpan(
                  text: " Manage Categories",
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Select Category'),
                  // DropdownButtonFormField(
                  //   value: dropdownValue,
                  //   onChanged: (String newValue) {
                  //     setState(() {
                  //       dropdownValue = newValue;
                  //     });
                  //   },
                  //   items: <String>['All', 'Work', 'Personal', 'Home']
                  //       .map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Add Category'),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Work..',
                      // labelText: 'Todo',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a task';
                      }
                    },
                    maxLines: null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        FirebaseServices.createTodo();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.red,
                  contentPadding: EdgeInsets.all(1),
                  title: Text('Work'),
                  // leading: Icon(Icons.add),
                  trailing: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.delete_forever,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
