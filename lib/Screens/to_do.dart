import 'package:flutter/material.dart';
import 'todo_models/todo_list_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDo_Page extends StatelessWidget {
  const ToDo_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ToDo_List(),
    );
  }
}

class ToDo_List extends StatefulWidget {
  const ToDo_List({Key? key}) : super(key: key);

  @override
  State<ToDo_List> createState() => _ToDo_ListState();
}

class _ToDo_ListState extends State<ToDo_List> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3FC120),
        title: Text(
          'Welcome To Visitor Log',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FAB clicked");
          navigateToPage('Add Task');
          //navigateToDetail(Note(0,'','',''),'Add Note');
        },
        tooltip: 'Add Task',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0Xff3fc120),
      ),
      body: todolistview(),
    );
  }
  
  ListView todolistview(){
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){


        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: Icon(Icons.task_outlined,color: Color(0Xff3fc120),),
                      //listTile
              title: Text(
                'dummy title',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Dummy dateTime',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              trailing: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onTap: () {
                debugPrint("ListTile tapped");
                navigateToPage('Edit Task');
                //navigateToDetail(this.noteList[position],'Edit Note');
              },
          ),
        );
      },
    );
  }
  void navigateToPage(String appbar){
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return ToDo_List_Page(appbar);
    }));
  }
}