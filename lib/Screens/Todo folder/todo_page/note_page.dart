import 'package:flutter/material.dart';
import 'package:pro_visitor/db/database.dart';
import '../todo_dart.dart';
import '../todo_widget/note_card_widget.dart';
import 'edit_note_page.dart';
import 'note_detail_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    //DbHelper.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    // notes = await NotesDatabase.instance.readAllNotes();
    notes = (await DbHelper.queryAll("Calendar_Record"))
        .map((json) => Note.fromJson(json))
        .toList();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     'Welcome To Visitor Log',
        //     style: TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   //actions: [Icon(Icons.search), SizedBox(width: 12)],
        // ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : notes.isEmpty
                  ? const Text(
                      'No Notes',
                      style: TextStyle(color: Color(0xff3FC120), fontSize: 24),
                    )
                  : buildNotes(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff3FC120),
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddEditNotePage()),
            );

            refreshNotes();
          },
        ),
      );

  Widget buildNotes() => ListView.builder(
        padding: const EdgeInsets.all(2),
        itemCount: notes.length,
        // shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        // physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final note = notes[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteDetailPage(noteId: note.id!),
              ));
              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
}
