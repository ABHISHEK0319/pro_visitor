

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


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
            
  return Slidable(
  // Specify a key if the Slidable is dismissible.
  key: const ValueKey(0),

  // The start action pane is the one at the left or the top side.
  startActionPane: ActionPane(
    dismissible: DismissiblePane(onDismissed: (){}),
    dragDismissible: false,
    // A motion is a widget used to control how the pane animates.
    motion: const ScrollMotion(),
    extentRatio: 0.50,
    
    // A pane can dismiss the Slidable.
    //dismissible: DismissiblePane(onDismissed: () {}),

    // All actions are defined in the children parameter.
    children: const [
      // A SlidableAction can have an icon and/or a label.
      SlidableAction(
        flex: 1,
        onPressed: null,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
        
       // borderRadius: BorderRadius.all(2.0),
      ),
      SlidableAction(
        onPressed: null,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        icon: Icons.share,
        label: 'Share',
        
      ),
    ],
  ),

  // The end action pane is the one at the right or the bottom side.
  endActionPane: const ActionPane(
    motion: ScrollMotion(),
    extentRatio: 0.25,
    children: [
      SlidableAction(
        // An action can be bigger than the others.
        flex: 1,
        onPressed: null,
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        icon: Icons.edit_note_outlined,
        label: 'Edit',
      ),
    ],
  ),

  // The child of the Slidable is what the user sees when the
  // component is not dragged.

          child: Card(
            
            //color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            color: Colors.white,
            //margin: EdgeInsets.all(4),
            //elevation: 8,
            child: ListTile(
              leading: Icon(Icons.task_outlined,color: Color(0Xff3fc120),),
                      //listTile
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
          ),
          );
        },
        itemCount: taskList.length,
      ),
      
      ),

);
    
  }
}