import 'package:flutter/material.dart';
import '../meet_model_dart.dart';
import '../meeting_dbhelper.dart';
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
  late String title;
  late String date;
  late String time;
  late String myContact;
  late String createdBy;

  @override
  void initState() {
    super.initState();

    title = widget.meeting?.title ?? '';
    date = widget.meeting?.date ?? '';
    time = widget.meeting?.time ?? '';
    myContact = widget.meeting?.myContact ?? '';
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
            title: title,
            date: date,
            time: time,
            myContact: myContact,
            createdBy: createdBy,
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDate: (date) => setState(() => this.date = date),
            onChangedTime: (time) => setState(() => this.time = time),
            onChangedMyContact: (myContact) =>
                setState(() => this.myContact = myContact),
            onChangedCreatedBy: (createdBy) =>
                setState(() => this.createdBy = createdBy),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && date.isNotEmpty && time.isNotEmpty;

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

      if (isUpdating) {
        await updateMeeting();
      } else {
        await addMeeting();
      }
    }
  }

  Future updateMeeting() async {
    final meeting = widget.meeting!.copy(
      title: title,
      date: date,
      time: time,
      myContact: myContact,
      createdBy: createdBy,
    );

    await MeetingsDatabase.instance.update(meeting);
  }

  Future addMeeting() async {
    final meeting = Meeting(
      title: title,
      date: date,
      time: time,
      myContact: myContact,
      createdBy: createdBy,
    );

    await MeetingsDatabase.instance.create(meeting);
  }
}
