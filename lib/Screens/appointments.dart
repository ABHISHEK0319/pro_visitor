
/*
import 'package:flutter/material.dart';
import 'appo_models/appo_list_page.dart';
import '../Screens/appo_Database/appoint_dbhelper.dart';
import '../Screens/appo_Database/appoint_data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'appo_Database/appoint_data.dart';

class Appo_Page extends StatelessWidget {
  const Appo_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appointment',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Appo_List(),
    );
  }
}

class Appo_List extends StatefulWidget {

  @override
  State<Appo_List> createState() => _Appo_ListState();
}

class _Appo_ListState extends State<Appo_List> {

  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff44336),
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
          navigateToPage('Add Appointment');
          //navigateToDetail(Note(0,'','',''),'Add Note');
        },
        tooltip: 'Add Appointments',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xfff44336),
      ),
      body: appolistview(),
    );
  }
  
  Widget appolistview(){
    return Expanded(
      child: ListView.builder(
        //itemCount: ,
        itemBuilder: (BuildContext context, int index){
    
    
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: Icon(Icons.task_outlined,color: Color(0xfff44336),),
                        //listTile
                title: Text(
                  'name',
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
                  navigateToPage('Edit Appointment');
                  //navigateToDetail(this.noteList[position],'Edit Note');
                },
            ),
          );
        },
      ),
    );
  }
  void navigateToPage(String appbar){
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return Appo_List_Page(appbar);
    }));
  }
}
*/