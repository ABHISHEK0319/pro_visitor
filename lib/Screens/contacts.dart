import 'package:flutter/material.dart';

class ContactActivity extends StatefulWidget {
  const ContactActivity({Key? key}) : super(key: key);

  @override
  State<ContactActivity> createState() => _ContactActivityState();
}

class _ContactActivityState extends State<ContactActivity> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Contact Activity.',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
