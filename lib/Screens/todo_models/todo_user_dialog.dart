import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/todo_models/todo_user_dialog.dart';
import 'package:pro_visitor/Screens/todo_models/todo_users.dart';
import 'package:intl/intl.dart';

class AddTaskDialog extends StatefulWidget {
  

  final Function(Task) addTask;

  AddTaskDialog(this.addTask);

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}


class _AddTaskDialogState extends State<AddTaskDialog> {

TextEditingController _date = TextEditingController();

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

    
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    //var dateController = TextEditingController();
    
    
    return Container(
      padding: EdgeInsets.all(8),
      height: 330,
      width: 400,
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
          
          
          //buildTextfield('Date', dateController),
          Padding(
                padding: EdgeInsets.all(10.0),
              ),
          TextField(
                controller: _date,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today_rounded),
                  border: OutlineInputBorder(),
                  hintText: 'Select Date',
                  labelText: 'Select Date',
                ),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(3000));
                  
      
                  if (pickeddate != null){
                      setState((){
                        _date.text = 
                        _date.text = DateFormat('dd-MM-yyyy').format(pickeddate);
                      }
                      );
                    }
                },
              ),
               Padding(
                padding: EdgeInsets.all(2.0),
              ),
              buildTextfield('Title', titleController),
              buildTextfield('Description', descriptionController),
      
          Padding(
                padding: EdgeInsets.all(8.0),
              ),
          RaisedButton(             //RaisedButton on alert diadlog
                  onPressed: (){

                    final task = Task(titleController.text, descriptionController.text,
                        _date.text);
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