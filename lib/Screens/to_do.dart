import 'package:flutter/material.dart';

class ToDoActivity extends StatelessWidget {
  const ToDoActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'To Do',
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }
}
