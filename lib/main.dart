import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Visitor App',
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: const Drawer(
        child: Text('Hello world!'),
      ),
    );
  }
}
