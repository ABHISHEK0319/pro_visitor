
import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/to_do.dart';
import 'dart:async';

class ToDo_List_Page extends StatefulWidget {
  
  String appBarTitle;
  ToDo_List_Page(this.appBarTitle);

  @override
  State<ToDo_List_Page> createState() {
  return ToDo_List_PageState(this.appBarTitle);
  }
}

class ToDo_List_PageState extends State<ToDo_List_Page> {

  String appBarTitle;

  TextEditingController titleController = TextEditingController();
  TextEditingController datetimeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  
  ToDo_List_PageState(this.appBarTitle);
    
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // Write some control things, when user press back navigation button in device
      onWillPop: () async {
        return true;
      },

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3fc120),
          title: Text(
            appBarTitle,
            //DateFormat('dd-MM-yyyy  KK:mm:ss a').format(DateTime.now()),
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            // Write some control things, when user press back navigation button in device
              debugPrint('Back Button Pressed');
              moveToLastScreen();
            }
          ),
        ),
        body:Container(
          
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              
              // first element
              Padding(
                padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                child:TextField(
                  //autofocus: true,
                  controller: titleController,
                  onChanged: (value) {
                    debugPrint("Something Changed in Title Text field");
                    //updateTitle();
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.title_outlined),
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                    labelText: 'Title',
                  ),
                ),
              ),
              // Second Element
              Padding(
                padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                child:TextField(
                  controller: datetimeController,
                  onChanged: (value) {
                    debugPrint("Something Changed in datetime Text field");
                    //updateDatetime();
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_month_outlined),
                    border: OutlineInputBorder(),
                    hintText: 'Date & Time',
                    labelText: 'Date & Time',
                  ),
                ),
              ),
              // Third Element
              Padding(
                padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                child:TextField(
                  controller:descriptionController,
                  onChanged: (value) {
                    debugPrint("Something Changed in description Text field");
                    //updateDescrption();
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.description_outlined),
                    border: OutlineInputBorder(),
                    hintText: 'Description',
                    labelText: 'Description',
                  ),
                  keyboardType: TextInputType.multiline,
                    maxLines: 3,
                ),
              ),
              // fourth element
              Padding(
                padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                child:Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        primary: Color(0xff3fc120)),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textScaleFactor: 1.5,
                        ),
                        onPressed: (){
                          setState(() {
                            debugPrint("save button is clicked");
                            //_save();
                          });
                        },
                      ),
                    ),
                    // fifth element
                    Container(width: 5.0,),
    
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        primary: Color(0xff3fc120)),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textScaleFactor: 1.5,
                        ),
                        onPressed: (){
                          setState(() {
                            debugPrint("Delete button is clicked");
                          });
                        },
                      ),
                    ) 
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void moveToLastScreen(){
    Navigator.pop(context);
  }
}