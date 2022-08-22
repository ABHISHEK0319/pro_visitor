import 'package:flutter/material.dart';
import 'package:pro_visitor/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Visitor Log',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
      // ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Visitor Log'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              tooltip: 'Settings',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('This is a snackbar'),
                    duration: Duration(milliseconds: 1500),
                    width: 280.0, // Width of the SnackBar.
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0, // Inner padding for SnackBar content.
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: const MyBottomNavBar(),
      ),
    );

    /*.....................No Use of Code.........................*/
    // return Scaffold(
    //   //
    //   appBar: AppBar(
    //     title: const Text(
    //       'Home',
    //       style: TextStyle(
    //         fontSize: 24,
    //         fontWeight: FontWeight.bold,
    //       ),
    //       textAlign: TextAlign.center,
    //     ),
    //   ),
    //   bottomNavigationBar: const MyBottomNavBar(),
    // );
  }
}
