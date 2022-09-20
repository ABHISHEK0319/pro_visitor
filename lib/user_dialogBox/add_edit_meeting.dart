import 'package:flutter/material.dart';
import 'package:pro_visitor/models/user_meeting.dart';
import '../Screens/meetings.dart';
import '../db/meeting_database.dart';

class AddEditMeeting extends StatefulWidget {
  final bool? isEdit;
  final UserMeetingData? selectedMeeting;
  const AddEditMeeting({
    Key? key,
    this.isEdit,
    this.selectedMeeting,
  }) : super(key: key);

  @override
  State<AddEditMeeting> createState() => _AddEditMeetingState();
}

class _AddEditMeetingState extends State<AddEditMeeting> {
  //late UserMeeting selectedMeeting;
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerTime = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.isEdit!) {
      controllerTitle.text = widget.selectedMeeting!.title;
      controllerTime.text = widget.selectedMeeting!.time;
      controllerDate.text = widget.selectedMeeting!.date;
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Meeting Title',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(controller: controllerTitle),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Meeting Time',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        controller: controllerTime,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Meeting date',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: controllerDate,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                ElevatedButton.icon(
                  onPressed: updateMethod,
                  icon: const Icon(Icons.save, color: Colors.white),
                  label: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateMethod() {
    var getMeetTitle = controllerTitle.text;
    var getMeetTime = controllerTime.text;
    var getMeetDate = controllerDate.text;

    if (getMeetTitle.isNotEmpty &&
        getMeetTime.isNotEmpty &&
        getMeetDate.isNotEmpty) {
      if (widget.isEdit!) {
        UserMeetingData updateMeeting = UserMeetingData(
            id: widget.selectedMeeting!.id,
            title: getMeetTitle,
            time: getMeetTime,
            date: getMeetDate);
        DatabaseHelper.instance.update(updateMeeting.toMap());
      } else {
        UserMeetingData addMeeting = UserMeetingData(
          title: getMeetTitle,
          time: getMeetTime,
          date: getMeetDate,
        );
        DatabaseHelper.instance.insert(addMeeting.toMapWithoutId());
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MeetingList()),
          (route) => false);
    }
  }
}
