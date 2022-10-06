import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/meeting_folder/meeting_page/model_meeting.dart';
import 'package:pro_visitor/db/database.dart';
import '../meeting_widget/meet_form_widget.dart';

class AddEditMeetingPage extends StatefulWidget {
  final ModelMeeting? meeting;

  const AddEditMeetingPage({
    Key? key,
    this.meeting,
  }) : super(key: key);
  @override
  State<AddEditMeetingPage> createState() => _AddEditMeetingPageState();
}

class _AddEditMeetingPageState extends State<AddEditMeetingPage> {
  final _formKey = GlobalKey<FormState>();
  late String meetId;
  late String meetHeader;
  late String meetDate;
  late String meetTime;
  late String meetContact;
  late String createdBy;

  @override
  void initState() {
    super.initState();
    meetId = widget.meeting?.meetId ?? '0';
    meetHeader = widget.meeting?.meetHeader ?? '';
    meetDate = widget.meeting?.meetDate ?? '';
    meetTime = widget.meeting?.meetTime ?? '';
    meetContact = widget.meeting?.meetContact ?? '';
    createdBy = widget.meeting?.createdBy ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Add Meetings'),
          titleTextStyle: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: MeetFormWidget(
            title: meetHeader,
            date: meetDate,
            time: meetTime,
            myContact: meetContact,
            createdBy: createdBy,
            onChangedTitle: (meetHeader) =>
                setState(() => this.meetHeader = meetHeader),
            onChangedDate: (meetDate) =>
                setState(() => this.meetDate = meetDate),
            onChangedTime: (meetTime) =>
                setState(() => this.meetTime = meetTime),
            onChangedMyContact: (meetContact) =>
                setState(() => this.meetContact = meetContact),
            onChangedCreatedBy: (createdBy) =>
                setState(() => this.createdBy = createdBy),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid =
        meetHeader.isNotEmpty && meetDate.isNotEmpty && meetTime.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10.0,
          shadowColor: Colors.red,
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey,
        ),
        onPressed: addOrUpdateNote,
        child: const Text(
          'Save',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void addOrUpdateNote() async {
    Navigator.of(context).pop();
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.meeting != null;
      // final isUpdating = int.parse(meetId) > 0;
      if (isUpdating) {
        // await updateMeeting();
      } else {
        await addMeeting();
      }
    }
  }

  // Future updateMeeting() async {
  //   final meeting = widget.meeting!.copy(
  //     meetId: meetId,
  //     meetHeader: meetHeader,
  //     meetDate: meetDate,
  //     meetTime: meetTime,
  //     meetContact: meetContact,
  //     createdBy: createdBy,
  //   );
  //   final db = await DbHelper.instance.getDatabase;
  //   await db.rawUpdate("UPDATE Meeting_Record SET meetHeader =?, meetDate=?, meetTime=?, meetContact=?, createdBy=? WHERE meetId =?)",
  //       [meetHeader, meetDate, meetTime, meetContact, createdBy, meetId]);
  // }

  Future addMeeting() async {
    // final meeting = Meeting(
    //   meetHeader: meetHeader,
    //   meetDate: meetDate,
    //   meetTime: meetTime,
    //   meetContact: meetContact,
    //   createdBy: createdBy,
    // );

    final db = await DbHelper.instance.getDatabase;
    List<Map<String, dynamic>> lastId = await DbHelper.querySpecific(
        "SELECT IFNULL(MAX(meetId), 0) AS LastId FROM Meeting_Record");
    String x = lastId.asMap().values.toList()[0].toString();
    RegExp re = RegExp(r'"[^\d]"', caseSensitive: false, multiLine: false);
    var result = re.allMatches(x);
    // final i = int.parse(lastId[0].map().toString());

    final h = int.parse(result.toString());
    print(h);
    // if (i >= 0) {
    //   List<Map<String, dynamic>> rs = await db.rawQuery(
    //       "INSERT INTO Meeting_Record VALUES (?,?,?,?,?,?)", [
    //     i + 1,
    //     meetHeader,
    //     meetDate,
    //     meetTime,
    //     meetContact,
    //     int.parse(createdBy)
    //   ]);

    //   int r = int.parse(rs[0].toString());

    //   if (r > 0) {
    //     print("Saved");
    //   } else {
    //     print(" Not Saved");
    //   }
    //   // await db.rawInsert(
    //   //     "INSERT INTO Meeting_Record VALUES (?,?,?,?,?)",
    //   //     [meetHeader, meetDate, meetTime, meetContact, createdBy]);
    // }
  }
}
