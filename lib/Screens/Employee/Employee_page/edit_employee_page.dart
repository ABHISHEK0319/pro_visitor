import 'package:flutter/material.dart';
import '../Employee_widget/employee_form_widget.dart';
import '../employee_dart.dart';
import '../employee_dbhelper.dart';

class AddEditEmployeePage extends StatefulWidget {
  final Employee? emp;

  const AddEditEmployeePage({
    Key? key,
    this.emp,
  }) : super(key: key);
  @override
  State<AddEditEmployeePage> createState() => _AddEditEmployeePageState();
}

class _AddEditEmployeePageState extends State<AddEditEmployeePage> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String contact;
  late String designation;

  @override
  void initState() {
    super.initState();

    name = widget.emp?.empname ?? '';
    contact = widget.emp?.empcontact ?? '';
    designation = widget.emp?.empdesignation ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Add Employee'),
          titleTextStyle: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: EmployeeFormWidget(
            name: name,
            contact: contact,
            designation: designation,
            onChangedName: (name) => setState(() => this.name = name),
            onChangedContact: (contact) =>
                setState(() => this.contact = contact),
            onChangedDesignation: (designation) =>
                setState(() => this.designation = designation),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid =
        name.isNotEmpty && contact.isNotEmpty && designation.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10.0,
          shadowColor: Colors.red,
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey,
        ),
        onPressed: addOrUpdateEmployee,
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

  void addOrUpdateEmployee() async {
    Navigator.of(context).pop();
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.emp != null;

      if (isUpdating) {
        await updateEmployee();
      } else {
        await addEmployee();
      }
    }
  }

  Future updateEmployee() async {
    final emp = widget.emp!.copy(
      empname: name,
      empcontact: contact,
      empdesignation: designation,
    );

    await NotesDatabase.instance.update(emp);
  }

  Future addEmployee() async {
    final emp = Employee(
      empname: name,
      empcontact: contact,
      empdesignation: designation,
    );

    await NotesDatabase.instance.create(emp);
  }
}
