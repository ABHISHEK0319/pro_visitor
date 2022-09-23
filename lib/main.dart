
/*
import 'package:flutter/material.dart';
import 'Screens/to_do.dart';
import 'Screens/appointments.dart';
import 'Screens/todo_models/todo_list_page.dart';

void main() {
  //runApp(const ToDo_Page());
  runApp(const Appo_Page());
}
*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:sqflite_database_example/page/notes_page.dart';
import 'package:pro_visitor/Screens/todo_page/note_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  static final String title = 'Notes SQLite';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Color(0xff3FC120),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff3FC120),
            elevation: 0,
          ),
        ),
        home: NotesPage(),
      );
}

