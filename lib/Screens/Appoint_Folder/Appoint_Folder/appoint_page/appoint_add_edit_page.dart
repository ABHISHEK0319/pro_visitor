import 'package:flutter/material.dart';
import 'package:pro_visitor/db/database.dart';
import '../../appoint_models/appoint_data.dart';
import '../../appoint_widget/appoint_form_widget.dart';

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
  late int appointid;
  late String appointname;
  late String appointdatetime;
  late String appointcontact;
  late String appointreason;

  @override
  void initState() {
    super.initState();
    appointid = widget.appoint?.appointid ?? 0;
    appointname = widget.appoint?.appointname ?? '';
    appointdatetime = widget.appoint?.appointdatetime ?? '';
    appointcontact = widget.appoint?.appointcontact ?? '';
    appointreason = widget.appoint?.appointreason ?? '';
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
            name: appointname,
            datetime: appointdatetime,
            contact: appointcontact,
            reason: appointreason,
            onChangedName: (name) => setState(() => this.appointname = name),
            onChangedDatetime: (datetime) =>
                setState(() => this.appointdatetime = datetime),
            onChangedContact: (contact) =>
                setState(() => this.appointcontact = contact),
            onChangedReason: (reason) =>
                setState(() => this.appointreason = reason),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = appointname.isNotEmpty &&
        appointdatetime.isNotEmpty &&
        appointcontact.isNotEmpty &&
        appointreason.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10.0,
          shadowColor: Colors.green,
          backgroundColor: isFormValid ? Colors.white : Colors.grey,
        ),
        onPressed: addOrUpdateAppoint,
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

  void addOrUpdateAppoint() async {
    Navigator.of(context).pop();
    final isValid = _formKey.currentState!.validate();
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
    final update_appoint = widget.appoint!.copy(
      appointid: appointid,
      appointname: appointname,
      appointdatetime: appointdatetime,
      appointcontact: appointcontact,
      appointreason: appointreason,
    );

    //await AppointDatabase.instance.update(update_appoint);

    final db = await DbHelper.instance.getDatabase;
    await db.rawUpdate(
        '''UPDATE Appointments_Record SET appointname=?, appointdatetime=?, appointcontact=?, appointreason = ? WHERE appointid =?''',
        [
          update_appoint.appointname,
          update_appoint.appointdatetime,
          update_appoint.appointcontact,
          update_appoint.appointreason,
          update_appoint.appointid
        ]);
  }

  Future addAppoint() async {
    final add_appoint = Appoint_Data(
      appointname: appointname,
      appointdatetime: appointdatetime,
      appointcontact: appointcontact,
      appointreason: appointreason,
    );
    //await AppointDatabase.instance.create(add_appoint);
    await DbHelper.insertData("Appointments_Record", add_appoint.toJson());
  }
}
