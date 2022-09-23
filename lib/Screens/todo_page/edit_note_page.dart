import 'package:flutter/material.dart';
//import 'package:sqflite_database_example/db/notes_database.dart';
import 'package:pro_visitor/Screens/todo_Database/todo_dbhelper.dart';
//import 'package:sqflite_database_example/model/note.dart';
import 'package:pro_visitor/Screens/todo_models/todo_data.dart';
//import 'package:sqflite_database_example/widget/note_form_widget.dart';
import 'package:pro_visitor/Screens/todo_widget/note_form_widget.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? note;

  const AddEditNotePage({
    Key? key,
    this.note,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String datetime;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.note?.title ?? '';
    datetime = widget.note?.datetime ?? '';
    description = widget.note?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Add Notes'),
          titleTextStyle: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: NoteFormWidget(
            title: title,
            datetime: datetime,
            description: description,
            onChangedTitle: (title) => 
                setState(() => this.title = title),
            onChangedDatetime: (datetime) =>
                setState(() => this.datetime = datetime),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && datetime.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey,
        ),
        onPressed: addOrUpdateNote,
        child: Text(
          'Save',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          ),
          
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      title: title,
      datetime: datetime,
      description: description,
    );

    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: title,
      datetime: datetime,
      description: description,
    );

    await NotesDatabase.instance.create(note);
  }
}