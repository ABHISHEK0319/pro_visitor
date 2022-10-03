import 'package:flutter/material.dart';
import '../Employee_widget/employee_card_widget.dart';
import '../employee_dart.dart';
import '../employee_dbhelper.dart';
import 'edit_employee_page.dart';
import 'employe_detail_page.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  late List<Employee> employees;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshEmp();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshEmp() async {
    setState(() => isLoading = true);

    employees = await NotesDatabase.instance.readAllEmp();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Employee',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          //actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : employees.isEmpty
                  ? const Text(
                      'No Employee',
                      style: TextStyle(color: Color(0xff3FC120), fontSize: 24),
                    )
                  : buildEmp(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const AddEditEmployeePage()),
            );

            refreshEmp();
          },
        ),
      );

  Widget buildEmp() => ListView.builder(
        padding: const EdgeInsets.all(2),
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final emp = employees[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EmployeeDetailPage(empId: emp.empid!),
              ));
              refreshEmp();
            },
            child: EmployeeCardWidget(emp: emp, index: index),
          );
        },
      );
}
