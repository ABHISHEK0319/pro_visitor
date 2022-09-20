// import 'package:flutter/material.dart';
// import 'package:pro_visitor/models/user_meeting.dart';

// class EditMeetingDialog extends StatefulWidget {
//   final UserMeetingData? userMeetingData;
//   const EditMeetingDialog({
//     Key? key,
//     this.userMeetingData,
//   }) : super(key: key);

//   @override
//   State<EditMeetingDialog> createState() => _EditMeetingDialogState();
// }

// class _EditMeetingDialogState extends State<EditMeetingDialog> {
//   late UserMeetingData userMeetingList;
//   int count = 0;
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

//     // Future updateMeeting() async {
//     //   final userMeetingData = widget.userMeetingData!.copy(
//     //     title: titleMeetController.text,
//     //     time: timeMeetController.text,
//     //     date: dateMeetController.text,
//     //   );

//     //   await DatabaseHelper.instance.update(userMeetingData);
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
//                 "Update Meeting",
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
//             Column(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     //Here update the list data in the database.....
//                     // updateMeetingList();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blueAccent,
//                     // side: const BorderSide(width: 1, color: Colors.blueAccent),
//                     elevation: 20,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     padding: const EdgeInsets.all(20),
//                   ),
//                   child: const Text(
//                     'Save',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {},
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blueAccent,
//                     // side: const BorderSide(width: 1, color: Colors.blueAccent),
//                     elevation: 20,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     padding: const EdgeInsets.all(20),
//                   ),
//                   child: const Text(
//                     'Cancel',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Future<void> updateMeetingList() async {
//   //   final db = DatabaseHelper.instance.updateMeeting(userMeetingList);
//   //   db.then((database) {
//   //     setState(() {
//   //       userMeetingList = userMeetingList;
//   //     });
//   //   });
//   // }
// }
