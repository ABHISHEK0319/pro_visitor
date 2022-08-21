import 'package:flutter/material.dart';

class MeetingActivity extends StatelessWidget {
  const MeetingActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Visitor Log',
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(
                height: 180.0,
                width: 350.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                  ),
                  color: Colors.orange,
                ),
                child: Stack(
                  children: [
                    PositioneMaterialApp(
debugShowCheckedModeBanner: false,
title: 'Welcome to Visitor Log',
home: Scaffold(
body: SizedBox(
height: 200,
width: 200,
child: Card(
color: Colors.blue,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ],
                ),
                //  Card(
                //       color: Colors.orangeAccent,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10.0), 
                //       ),
                //       elevation: 20.0,
                //       margin: const EdgeInsets.only(
                //         left: 10.0,
                //         top: 50.0,
                //         right: 10.0,
                //       ),
                //       shadowColor: Colors.orange,
                //     )
              ),
            ),
          ],
        ),
      ),
    );

    //  const Center(
    //   child: Text(
    //     'Meetings',
    //     style: TextStyle(fontSize: 50.0),
    //   ),
    // );
  }
}
