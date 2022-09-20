// import 'package:flutter/material.dart';
// import 'package:pro_visitor/models/user_meeting.dart';
// import 'package:pro_visitor/db/meeting_database.dart';
// import 'package:sqflite/sqflite.dart';

// class AddMeetingDialog extends StatefulWidget {
//   const AddMeetingDialog({
//     Key? key,
//     required this.addMeetData,
//   }) : super(key: key);

//   final Function(UserMeetingData) addMeetData;

//   @override
//   State<AddMeetingDialog> createState() => _AddMeetingDialogState();
// }

// class _AddMeetingDialogState extends State<AddMeetingDialog> {
//   late UserMeetingData userMeetingList;
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     Widget buildTextfield(String hint, TextEditingController controller) {
//       return Container(
//         margin: const EdgeInsets.all(4),
//         child: TextField(
//           decoration: InputDecoration(
//               labelText: hint,
//               border: const OutlineInputBorder(
//                   borderSide: BorderSide(
//                 color: Colors.black38,
//               ))),
//           controller: controller,
//         ),
//       );
//     }

//     final titleMeetController = TextEditingController();
//     final timeMeetController = TextEditingController();
//     final dateMeetController = TextEditingController();

//     // void addMeetData() async {
//     //   await DatabaseHelper.instance.insertMeetData(UserMeetingData(
//     //     title: titleMeetController.text,
//     //     time: timeMeetController.text,
//     //     date: dateMeetController.text,
//     //   ));
//     //   setState(() {
//     //     titleMeetController.clear();
//     //     timeMeetController.clear();
//     //     dateMeetController.clear();
//     //   });
//     // }

//     return SizedBox(
//       // padding: const EdgeInsets.all(15),
//       height: 340,
//       width: 400,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Center(
//               child: Text(
//                 "Add Meeting",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 28,
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             buildTextfield('Title of the Meeting.', titleMeetController),
//             buildTextfield("Mention the time", timeMeetController),
//             buildTextfield("Mention the date", dateMeetController),

//             const SizedBox(
//               height: 20,
//             ),
//             //Here create the button in the dialog box...
//             ElevatedButton(
//               onPressed: () async {
//                 var userMeetingData = UserMeetingData(
//                   title: titleMeetController.text,
//                   time: timeMeetController.text,
//                   date: dateMeetController.text,
//                 );
//                 // await DatabaseHelper.instance
//                 //     .insertMeetData(
//                 widget.addMeetData(userMeetingData);
//                 // );
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blueAccent,
//                 // side: const BorderSide(width: 1, color: Colors.blueAccent),
//                 elevation: 20,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 padding: const EdgeInsets.all(20),
//               ),
//               child: const Text(
//                 'Add',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontStyle: FontStyle.normal,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
