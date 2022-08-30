
import 'package:flutter/material.dart';

import 'package:pro_visitor/Screens/todo_models/todo_user_dialog.dart';
import 'package:pro_visitor/Screens/todo_models/todo_users.dart';

class ToDopage extends StatelessWidget {
  const ToDopage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ToDoActivity(),
    );
  }
}

class ToDoActivity extends StatefulWidget {
  

  @override
  State<ToDoActivity> createState() => _ToDoActivityState();
  
}

class _ToDoActivityState extends State<ToDoActivity> {


  List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    
   

  void addTaskData(Task task){
    setState(() {
      taskList.add(task);
    });
  }
  
  
  
    void showTaskDialog(){
      showDialog(context: context, 
      builder: (_){
        return SingleChildScrollView(
          child: AlertDialog(
            alignment: Alignment.center,
              content: AddTaskDialog(addTaskData),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
        );
      },
    );
  }
   

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showTaskDialog,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0Xff3fc120),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff3fc120),
        title: Text(
          'Welcome To Visitor Log',
          //DateFormat('dd-MM-yyyy  KK:mm:ss a').format(DateTime.now()),
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      
      body: Container(
        height: MediaQuery.of(context).size.height * 1.0,
        child: ListView.builder(
          itemBuilder: (ctx,index){
          return Card(
            color: Colors.white,
            margin: EdgeInsets.all(4),
            elevation: 8,
            child: ListTile(        //listTile
              title: Text(taskList[index].title,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(taskList[index].description,
                style: TextStyle(
                  fontSize: 15.0,
                  
                ),
              ),
              trailing: Text(
                taskList[index].date,
                
                style: TextStyle(
                  fontSize: 18.0,
                  
                ),
              ),
            ),
          );
        },
        itemCount: taskList.length,
      ),
      ),
    );
  }
}



/*


import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


class ToDopage extends StatelessWidget {
  const ToDopage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToDoActivity(),
    );
  }
}



class ToDoActivity extends StatefulWidget {
  const ToDoActivity({Key? key}) : super(key: key);

  @override
  State<ToDoActivity> createState() => _ToDoActivityState();
}

class _ToDoActivityState extends State<ToDoActivity> {

  String myvar = "";
  String texttodisplay = "Default";

  void showtext(){
    setState(() {
      texttodisplay = myvar;
    });
  }


  void showalertdialog(){
    showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(
            "Add Task",
            style: TextStyle(
              fontSize: 24.0,
              color: Color(0Xff3fc120),
            ),
          ),
          //child: SingleChildScrollView(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              TextField(                 //textfeild on alertdialog
                onChanged: (text){
                  myvar = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                  labelText: 'Title',
                ),
                autofocus: true,
                style: TextStyle(
                  //fontSize: 18.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              TextField(                 //textfeild on alertdialog
                onChanged: (text){
                  myvar = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description',
                  labelText: 'Description',
                ),
                autofocus: true,
                maxLines: 2,
                style: TextStyle(
                  //fontSize: 18.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              TextField(
                controller: _date,
      
                                //textfeild on alertdialog
                onChanged: (text){
                  myvar = text;
                },
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
                        _date.text = DateFormat('dd-MM-yyyy').format(pickeddate);
                      }
                      );
                    }
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(             //RaisedButton on alert diadlog
                    onPressed: (){
                      showtext();
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
            ],
          ),
        ),
      ),
    );
  }

  Widget todocard(String task){  //todocard widget
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(                  //listtile
          leading: Icon(Icons.work_history_rounded),
          
          title: Text(
            "$task",
            style: TextStyle(
              //fontSize: 18.0,
              color: Color(0Xff3fc120),
            ),
          ),
          onLongPress: () {
            print("Should Get Deleted");
          },
        ),
      ),
    );
  }

  //Datetime picker
  TextEditingController _date =TextEditingController();


// Scaffold Widget is here
//Floating Actio button
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showalertdialog,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0Xff3fc120),
      ),
    

      appBar: AppBar(
        backgroundColor: Color(0xff3fc120),
        title: Text(
          'Welcome To Visitor Log',
          //DateFormat('dd-MM-yyyy  KK:mm:ss a').format(DateTime.now()),
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      
      body: Center(
          child:SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            todocard("$texttodisplay"),
            ],
          ),
        ),
      ),
    );
  }
}

*/
