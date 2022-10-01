import 'package:flutter/material.dart';
import '../employee_dart.dart';
import '../employee_dbhelper.dart';
import 'edit_employee_page.dart';

class EmployeeDetailPage extends StatefulWidget {
  final int empId;

  const EmployeeDetailPage({
    Key? key,
    required this.empId,
  }) : super(key: key);

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  late Employee employee;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshEmp();
  }

  Future refreshEmp() async {
    setState(() => isLoading = true);

    this.employee = await NotesDatabase.instance.readEmp(widget.empId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('View Employee'),
          titleTextStyle: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      employee.empname,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      employee.empcontact,
                      //DateFormat.yMMMd().format(note.createdTime),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      employee.empdestination,
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 18.0),
                    )
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditEmployeePage(emp: employee),
        ));

        refreshEmp();
      });

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          Navigator.of(context).pop();
          await NotesDatabase.instance.delete(widget.empId);
        },
      );
}
