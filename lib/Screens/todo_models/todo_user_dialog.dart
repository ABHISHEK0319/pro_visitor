import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/todo_models/todo_users.dart';

class AddTaskDialog extends StatefulWidget {
  
  final Function(Task) addTask;

  AddTaskDialog(this.addTask);

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {

TextEditingController _title = TextEditingController();
TextEditingController _description = TextEditingController();
TextEditingController _datetime = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Widget buildTextfield(String hint, TextEditingController controller ){
      
      return Container(
        margin: EdgeInsets.all(4.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff3fc120),
              ),
            ),
          ),
          controller: controller,
        ),
      );
    }
    return Container(
      padding: EdgeInsets.all(8),
      height: 330,
      width: 500,
      child: Column(
        children: [
          Text(
            'Add Task',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(0xff3fc120),
            ),
            ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              TextField(
                autofocus: true,
                controller: _title,
                decoration: const InputDecoration(
                  icon: Icon(Icons.title_outlined),
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                  labelText: 'Title',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              TextField(
                controller: _description,
                decoration: const InputDecoration(
                  icon: Icon(Icons.description_outlined),
                  border: OutlineInputBorder(),
                  hintText: 'Description',
                  labelText: 'Description',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              TextField(
                controller: _datetime,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_month_outlined),
                  border: OutlineInputBorder(),
                  hintText: 'Date & Time',
                  labelText: 'Date & Time',
                ),
              ),
          Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
          RaisedButton(             //RaisedButton on alert diadlog
                  onPressed: (){
                    final task = Task(_title.text, _description.text,
                        _datetime.text);
                    widget.addTask(task);
                    Navigator.of(context).pop();
                  },
                  color: Color(0Xff3fc120),
                  child: Text(
                    "ADD",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}