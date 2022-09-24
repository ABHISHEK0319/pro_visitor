import 'package:flutter/material.dart';
import '../todo_dart.dart';
import '../todo_dbhelper.dart';
import '../todo_widget/note_form_widget.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? note;

  const AddEditNotePage({
    Key? key,
    this.note,
  }) : super(key: key);
  @override
  State<AddEditNotePage> createState() => _AddEditNotePageState();
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
          title: const Text('Add Notes'),
          titleTextStyle: const TextStyle(
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
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDatetime: (datetime) =>
                setState(() => this.datetime = datetime),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid =
        title.isNotEmpty && datetime.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10.0,
          shadowColor: Colors.red,
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey,
        ),
        onPressed: addOrUpdateNote,
        child: const Text(
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
    Navigator.of(context).pop();
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }
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
