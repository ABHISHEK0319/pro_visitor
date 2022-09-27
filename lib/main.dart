
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_visitor/Screens/Todo_Folder/todo_page/note_page.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_page/appoint_list_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //runApp(TodoApp());
  runApp(AppointApp());
}