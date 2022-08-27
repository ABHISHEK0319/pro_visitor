import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pro_visitor/models/user_meeting.dart';
import 'package:pro_visitor/user_dialogBox/meeting_dialog.dart';

class MeetingActivity extends StatelessWidget {
  const MeetingActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final screenweight = MediaQuery.of(context).size.width;
    //final screenheight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Visitor Log',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white10,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Scaffold(
        body: MeetingList(),
      ),
    );
  }
}

class MeetingList extends StatefulWidget {
  const MeetingList({Key? key}) : super(key: key);

  @override
  State<MeetingList> createState() => _MeetingListState();
}

class _MeetingListState extends State<MeetingList> {
  //Create list here.....Model...
  List<UserMeetingDetails> userList = [];

  @override
  Widget build(BuildContext context) {
    //Here add data through this method...........******
    void addMeetData(UserMeetingDetails userMeeting) {
      setState(() {
        userList.add(userMeeting);
      });
    }

    //Here this method is showing dialogBox.....
    void showMeetDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: AddMeetingDialog(addMeetData: addMeetData),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showMeetDialog,
        splashColor: const Color.fromRGBO(255, 152, 0, 1),
        tooltip: 'Add Meeting',
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final item = userList[index].toString();
            return Slidable(
              // Specify a key if the Slidable is dismissible.
              key: ValueKey(item),
              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                dragDismissible: false,
                // A motion is a widget used to control how the pane animates.
                motion: const StretchMotion(),
                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {
                  setState(() {
                    userList.removeAt(index);
                  });
                }),

                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: ((context) {}),
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                  const SlidableAction(
                    onPressed: null,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    //An action can be bigger than the others.
                    flex: 2,
                    onPressed: (BuildContext context) {
                      setState(() {
                        userList.removeAt(index);
                      });
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Deleted',
                  ),
                ],
              ),
              child: Card(
                //Here define meeting list random colors.........
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                elevation: 8,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 20,
                    left: 30,
                  ),
                  title: Text(
                    userList[index].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    userList[index].time,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    userList[index].date,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //  )
              ),
            );
          },
          itemCount: userList.length,
        ),
      ),
    );
  }
}
