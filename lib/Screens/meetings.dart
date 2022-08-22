import 'package:flutter/material.dart';

class MeetingActivity extends StatelessWidget {
  const MeetingActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Visitor Log',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
      ),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 230.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                ),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
