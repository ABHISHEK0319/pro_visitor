import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../db/database.dart';
import '../todo_dart.dart';
import 'edit_note_page.dart';

// ignore: must_be_immutable
class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    note = await DbHelper.instance.readNote(widget.noteId);


    // final db = await DbHelper.instance.getDatabase;
    // note = await db.rawQuery('''UPDATE Todo_Record SET title=?, datetime=?, description = ? WHERE id =?''',
    // [note.title, note.datetime, note.description, note.id]);


    // column:
    // NoteFields.values;
    // note = (await DbHelper.querySearch(
    //         "Todo_Record", "${NoteFields.id}=?", [widget.noteId]))
    //     .map((json) => Note.fromJson(json))
    //     .toList();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('View Note'),
          titleTextStyle: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      note.datetime,
                      //DateFormat.yMMMd().format(note.createdTime),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      note.description,
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 18.0),
                    )
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNotePage(note: note),
        ));
        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          await DbHelper.deleteData(
              "Todo_Record", "id = ?", [note.id]).whenComplete(() => Navigator.of(context).pop());
          // await NotesDatabase.instance.delete(widget.noteId);
        },
      );
}
