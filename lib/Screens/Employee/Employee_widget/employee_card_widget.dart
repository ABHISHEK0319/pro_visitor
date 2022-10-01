import 'package:flutter/material.dart';
import '../employee_dart.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class EmployeeCardWidget extends StatelessWidget {
  const EmployeeCardWidget({
    Key? key,
    required this.emp,
    required this.index,
  }) : super(key: key);

  final Employee emp;
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = _lightColors[index % _lightColors.length];

    return Card(
      color: color,
      child: Container(
        padding: const EdgeInsets.all(1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.description_outlined),
              title: Text(
                emp.empname,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //SizedBox(height: 4),
              subtitle: Text(
                emp.empcontact,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
