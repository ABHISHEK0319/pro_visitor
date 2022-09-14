
import 'package:flutter/material.dart';
import 'dart:async';


class Appo_List_Page extends StatefulWidget {
  
  String appBarTitle;
  Appo_List_Page(this.appBarTitle);

  @override
  State<Appo_List_Page> createState() {
  return Appo_List_PageState(this.appBarTitle);
  }
}

class Appo_List_PageState extends State<Appo_List_Page> {

  String appBarTitle;

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController datetimeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  
  Appo_List_PageState(this.appBarTitle);
    
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // Write some control things, when user press back navigation button in device
      onWillPop: () async {
        return true;
      },

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff44336),
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
                  controller: nameController,
                  onChanged: (value) {
                    debugPrint("Something Changed in Name Textfield");
                    //updateTitle();
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                    labelText: 'Name',
                  ),
                ),
              ),
              //Second Element
              Padding(
                padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                child:TextField(
                  //autofocus: true,
                  controller: contactController,
                  onChanged: (value) {
                    debugPrint("Something Changed in Contact Textfield");
                    //updateTitle();
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.call),
                    border: OutlineInputBorder(),
                    hintText: 'Contact',
                    labelText: 'Contact',
                  ),
                ),
              ),

              // Third Element
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
              // Fourth Element
              Padding(
                padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                child:TextField(
                  controller:reasonController,
                  onChanged: (value) {
                    debugPrint("Something Changed in Reason Text field");
                    //updateDescrption();
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.question_mark),
                    border: OutlineInputBorder(),
                    hintText: 'Reason',
                    labelText: 'Reason',
                  ),
                  keyboardType: TextInputType.multiline,
                    maxLines: 3,
                ),
              ),
              // fifth element
              Padding(
                padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                child:Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        primary: Color(0xfff44336)),
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
                    // Sixth element
                    Container(width: 5.0,),
    
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        primary: Color(0xfff44336)),
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