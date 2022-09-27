import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_Database/appoint_dbhelper.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_models/appoint_data.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_widget/appoint_form_widget.dart';

class AppointAddEditPage extends StatefulWidget {
  final Appoint_Data? appoint;

  const AppointAddEditPage({
    Key? key,
    this.appoint,
  }) : super(key: key);
  @override
  _AppointAddEditPageState createState() => _AppointAddEditPageState();
}

class _AppointAddEditPageState extends State<AppointAddEditPage> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String datetime;
  late String contact;
  late String reason;

  @override
  void initState() {
    super.initState();

    name = widget.appoint?.name ?? '';
    datetime = widget.appoint?.datetime ?? '';
    contact = widget.appoint?.contact ?? '';
    reason = widget.appoint?.reason ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Add Appointment'),
          titleTextStyle: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: AppointFormWidget(
            name: name,
            datetime: datetime,
            contact: contact,
            reason: reason,
            onChangedName: (name) => setState(() => this.name = name),
            onChangedDatetime: (datetime) =>
                setState(() => this.datetime = datetime),
            onChangedContact: (contact) =>
                setState(() => this.contact = contact),
            onChangedReason: (reason) => setState(() => this.reason = reason),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = name.isNotEmpty &&
        datetime.isNotEmpty &&
        contact.isNotEmpty &&
        reason.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10.0,
          shadowColor: Colors.green,
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey,
        ),
        onPressed: addOrUpdateAppoint,
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

  void addOrUpdateAppoint() async {
    final isValid = _formKey.currentState!.validate();
    Navigator.of(context).pop();
    if (isValid) {
      final isUpdating = widget.appoint != null;

      if (isUpdating) {
        await updateAppoint();
      } else {
        await addAppoint();
      }
    }
  }

  Future updateAppoint() async {
    final note = widget.appoint!.copy(
      name: name,
      datetime: datetime,
      contact: contact,
      reason: reason,
    );

    await AppointDatabase.instance.update(note);
  }

  Future addAppoint() async {
    final note = Appoint_Data(
      name: name,
      datetime: datetime,
      contact: contact,
      reason: reason,
    );

    await AppointDatabase.instance.create(note);
  }
}
