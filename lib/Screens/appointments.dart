
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:pro_visitor/Screens/appo_models/appo_user_dialog.dart';
import 'package:pro_visitor/Screens/appo_models/appo_users.dart';

class Appointment_page extends StatelessWidget {
  const Appointment_page({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appointment',
      theme: ThemeData(
        //primarySwatch: Colors.red,
      ),
      home: AppointActivity(),
    );
  }
}

class AppointActivity extends StatefulWidget {
  const AppointActivity({Key? key}) : super(key: key);

  @override
  State<AppointActivity> createState() => _AppointActivityState();
}

class _AppointActivityState extends State<AppointActivity> {
  List<Appointment> Appoint_List = [];
  @override
  Widget build(BuildContext context) {

    void Add_Appoint_Data(Appointment appoint_ment){
    setState(() {
      Appoint_List.add(appoint_ment);
    });
  }

    void Show_Appoint_Dialog(){
      showDialog(context: context,  
      builder: (_){
        return SingleChildScrollView(
          child: AlertDialog(
            alignment: Alignment.center,
              content: add_appoint(Add_Appoint_Data),
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
        onPressed: Show_Appoint_Dialog,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0XffF44336),
      ),
      appBar: AppBar(
        backgroundColor: Color(0XffF44336),
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
        //height: MediaQuery.of(context).size.height * 1.0,
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
    extentRatio: 0.25,
    
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
        icon: Icons.edit,
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
              leading: Icon(Icons.task_outlined,color: Color(0XffF44336),),
                      //listTile
              title: Text(Appoint_List[index].AppointName,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(Appoint_List[index].AppointReason,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              trailing: Text(
                Appoint_List[index].AppointDateTime,
                
                semanticsLabel: Appoint_List[index].AppointDateTime,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                ),
              
          ),
          ),
        );
        },
        itemCount: Appoint_List.length,
      ),
          
      ),
    );
  }
}
