import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/meeting_folder/meeting_models/meet_model_dart.dart';
import 'package:pro_visitor/db/database.dart';
import '../meeting_widget/meet_form_widget.dart';

class AddEditMeetingPage extends StatefulWidget {
  final Meeting? meeting;

  const AddEditMeetingPage({
    Key? key,
    this.meeting,
  }) : super(key: key);
  @override
  State<AddEditMeetingPage> createState() => _AddEditMeetingPageState();
}

class _AddEditMeetingPageState extends State<AddEditMeetingPage> {
  final _formKey = GlobalKey<FormState>();
  late int meetId;
  late String meetTitle;
  late String meetDate;
  late String meetTime;
  late String meetContact;
  late String createdBy;

  @override
  void initState() {
    super.initState();
    meetId = widget.meeting?.meetId ?? 0;
    meetTitle = widget.meeting?.meetTitle ?? '';
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
            title: meetTitle,
            date: meetDate,
            time: meetTime,
            myContact: meetContact,
            createdBy: createdBy,
            onChangedTitle: (meetTitle) =>
                setState(() => this.meetTitle = meetTitle),
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
        meetTitle.isNotEmpty && meetDate.isNotEmpty && meetTime.isNotEmpty && meetContact.isNotEmpty && createdBy.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10.0,
          shadowColor: Colors.red,
          backgroundColor: isFormValid ? Colors.white : Colors.grey,
        ),
        onPressed: addOrUpdateNote,
        child: const Text(
          'Save',
          style: TextStyle(
            color: Colors.black,
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
      if (isUpdating) {
        await updateMeeting();
      } else {
        await addMeeting();
      }
    }
  }

  Future updateMeeting() async {
    final meeting = widget.meeting!.copy(
      meetId: meetId,
      meetTitle: meetTitle,
      meetDate: meetDate,
      meetTime: meetTime,
      meetContact: meetContact,
      createdBy: createdBy,
    );

    final db = await DbHelper.instance.getDatabase;
    await db.rawUpdate("UPDATE Meetings_Record SET meetTitle =?, meetDate=?, meetTime=?, meetContact=?, createdBy=? WHERE meetId =?",
        [meeting.meetTitle, meeting.meetDate, meeting.meetTime, meeting.meetContact, meeting.createdBy, meeting.meetId]);
  }

  Future addMeeting() async {
    final meeting = Meeting(
      meetTitle: meetTitle,
      meetDate: meetDate,
      meetTime: meetTime,
      meetContact: meetContact,
      createdBy: createdBy,
    );

    await DbHelper.insertData("Meetings_Record", meeting.toJson());
  }
}
