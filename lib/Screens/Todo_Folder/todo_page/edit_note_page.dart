
import 'package:flutter/material.dart';
import '../../../db/database.dart';
import '../todo_models/todo_dart.dart';
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
  late int todoid;
  late String todotitle;
  late String tododatetime;
  late String tododescription;

  @override
  void initState() {
    super.initState();
    todoid = widget.note?.todoid ?? 0;
    todotitle = widget.note?.todotitle ?? '';
    tododatetime = widget.note?.tododatetime ?? '';
    tododescription = widget.note?.tododescription ?? '';
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
            title: todotitle,
            datetime: tododatetime,
            description: tododescription,
            onChangedTitle: (title) => 
                setState(() => this.todotitle = title),
            onChangedDatetime: (datetime) =>
                setState(() => this.tododatetime = datetime),
            onChangedDescription: (description) =>
                setState(() => this.tododescription = description),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid =
        todotitle.isNotEmpty && tododatetime.isNotEmpty && tododescription.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10.0,
          shadowColor: Colors.red,
          backgroundColor: isFormValid ? Colors.white : Colors.grey,
        ),
        onPressed: isFormValid? addOrUpdateNote: null,
        child: const Text(
          'Save',
          style: TextStyle(
            color: Colors.black,
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
      todoid: todoid,
      todotitle: todotitle,
      tododatetime: tododatetime,
      tododescription: tododescription,
    );

    // await NotesDatabase.instance.update(note);
    
    //await DbHelper.updateData(
    //  "Todo_Record", note.toJson(), '${NoteFields.id} = ?', [note.id]).whenComplete(() => Navigator.of(context).pop());
    //  print(await DbHelper.queryAll("Todo_Record"));
    final db = await DbHelper.instance.getDatabase;
    await db.rawUpdate('''UPDATE Todo_Record SET todotitle=?, tododatetime=?, tododescription = ? WHERE todoid =?''',
    [note.todotitle, note.tododatetime, note.tododescription, note.todoid]);
  }

  Future addNote() async {
    final note = Note(
      todotitle: todotitle,
      tododatetime: tododatetime,
      tododescription: tododescription,
    );
    // final db = await DbHelper.instance.getDatabase;
    await DbHelper.insertData("Todo_Record", note.toJson());

    // await NotesDatabase.instance.create(note);
  }
}
