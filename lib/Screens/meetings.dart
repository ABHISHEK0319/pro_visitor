import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pro_visitor/db/meeting_database.dart';
import 'package:pro_visitor/models/user_meeting.dart';
import '../user_dialogBox/add_edit_meeting.dart';

class MeetingActivity extends StatelessWidget {
  const MeetingActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //WidgetsFlutterBinding.ensureInitialized();
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
  List<UserMeetingData> userMeetingList = [];
  bool isLoading = false;
  int count = 0;

  Future getMeetings() async {
    List<Map<String, dynamic>> listMap =
        await DatabaseHelper.instance.queryAllRows();
    setState(() {
      for (var map in listMap) {
        userMeetingList.add(UserMeetingData.fromMap(map));
      }
    });
    // return listMap;
  }

  @override
  void initState() {
    getMeetings();
    super.initState();
    // refreshMeetings();
  }

  // void refreshMeetings() async {
  //   setState(() => isLoading = true);
  //   var listJson = await rootBundle.loadString('query');
  // }

  @override
  Widget build(BuildContext context) {
    //   //List Id variable..here..
    //   //int? selectedId;
    //   //refreshMeetings();
    //   //Here add data through this method...........******
    //   void addMeetData(UserMeetingData userMeetingData) {
    //     userMeetingList = <UserMeetingData>[];
    //     setState(() {
    //       userMeetingList.add(userMeetingData);
    //     });
    //   }
    //Here this method is showing dialogBox.....
    // void showMeetDialog() {
    //   showDialog(
    //     context: context,
    //     builder: (_) {
    //       return AlertDialog(
    //         content: AddMeetingDialog(addMeetData: addMeetData),
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //       );
    //     },
    //   );
    // }
    // //Here this method is showing dialogBox.....
    // void showWditMeetDialog() {
    //   showDialog(
    //     context: context,
    //     builder: (_) {
    //       return AlertDialog(
    //         content: EditMeetingDialog(addMeetData: userMeetingData),
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //       );
    //     },
    //   );
    // }
    //Here define edituserlist code............
    // editUserList(index) {
    //   Future.delayed(Duration.zero, () {
    //     //your code goes here
    //     showDialog(
    //         context: context,
    //         builder: (context) {
    //           return AlertDialog(
    //             content: SingleChildScrollView(
    //               child: SizedBox(
    //                 height: 200,
    //                 child: Column(
    //                   children: const [
    //                     Padding(
    //                       padding: EdgeInsets.all(10.0),
    //                       child: Text(
    //                         'Update The Meeting.',
    //                         style: TextStyle(
    //                           color: Colors.blue,
    //                           fontSize: 22,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                         textAlign: TextAlign.center,
    //                       ),
    //                     ),
    //                     child: Column(
    //                       children: [
    //                         TextFormField(
    //                           //****define decoration of the textformField....
    //                           decoration: const InputDecoration(
    //                             icon: Icon(Icons.title),
    //                             hintText: 'Title.',
    //                           ),
    //                           initialValue: user.title,
    //                           onFieldSubmitted: (_) => Navigator.of(context).pop(),
    //                           onChanged: (title) =>
    //                               setState(() => user.title = title),
    //                         ),
    //                       ],
    //                     ),
    //                     TextFormField(
    //                       //****define decoration of the textformField....
    //                       decoration: const InputDecoration(
    //                         icon: Icon(Icons.timeline),
    //                         hintText: 'Time',
    //                       ),
    //                       initialValue: ,
    //                       onFieldSubmitted: (_) => Navigator.of(context).pop(),
    //                       onChanged: (time) => setState(() => user.time = time),
    //                     ),
    //                     TextFormField(
    //                     ****define decoration of the textformField....
    //                         decoration: const InputDecoration(
    //                           icon: Icon(Icons.date_range),
    //                           hintText: 'Date',
    //                         ),
    //                         initialValue: user.date,
    //                         onFieldSubmitted: (_) => Navigator.of(context).pop(),
    //                         onChanged: (date) => setState(() => user.date = date),
    //                       ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             actions: <Widget>[
    //               OutlinedButton(
    //                   onPressed: () {
    //                     setState(() {});
    //                   },
    //                   child: const Text('Save')),
    //               OutlinedButton(
    //                   onPressed: () {
    //                     Navigator.of(context).pop();
    //                   },
    //                   child: const Text('Cancel')),
    //             ],
    //           );
    //         });
    //   });
    // }
    ///***** ......Here Define build method returns the widgets....*************////
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const AddEditMeeting(isEdit: false)));
        },
        splashColor: const Color.fromRGBO(255, 152, 0, 1),
        tooltip: 'Add Meeting',
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: ListView.builder(
            itemCount: userMeetingList.length,
            itemBuilder: (context, int index) {
              UserMeetingData item = userMeetingList[index];
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
                      //UserMeetingData.fromMap(remove);
                    });
                  }),

                  // All actions are defined in the children parameter.
                  children: [
                    // A SlidableAction can have an icon and/or a label.
                    SlidableAction(
                      onPressed: (context) async {
                        if (isLoading) return;
                        //EditMeetingDialog(userMeetingData: item);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddEditMeeting(
                                    isEdit: true, selectedMeeting: item)));
                      },
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
                      onPressed: (context) async {
                        // await DatabaseHelper.instance
                        //     .deleteMeeting(userMeetingList.id);
                        DatabaseHelper.instance.delete(item.id!);
                        setState(() => {
                              userMeetingList
                                  .removeWhere((item) => item.id == item.id)
                            });
                      },

                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Deleted',
                    ),
                  ],
                ),

                //** ....*** Here define List codes... ***

                child: Card(
                  //Here define meeting list random colors.........
                  // color:
                  //     Colors.primaries[Random().nextInt(Colors.primaries.length)],
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
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      item.time,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      item.date,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
