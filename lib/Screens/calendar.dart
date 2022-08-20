import 'package:flutter/material.dart';

class CalendarActivity extends StatelessWidget {
  const CalendarActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        //three dots icon is set right side...here avalible code..
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            tooltip: 'Settings',
            onPressed: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //       content: const Text('This is a snackbar'),
              //       duration: const Duration(milliseconds: 1500),
              //       width: 280.0, // Width of the SnackBar.
              //       padding: const EdgeInsets.symmetric(
              //         horizontal: 8.0, // Inner padding for SnackBar content.
              //       ),
              //       margin: const EdgeInsets.(vertical: 200.0)),
              // );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Calendar',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
