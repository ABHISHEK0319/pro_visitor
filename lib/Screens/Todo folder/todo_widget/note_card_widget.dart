import 'package:flutter/material.dart';
import '../todo_dart.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = _lightColors[index % _lightColors.length];

    return Card(
      color: color,
      child: Container(
        padding: const EdgeInsets.all(1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.description_outlined),
              title: Text(
                note.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //SizedBox(height: 4),
              subtitle: Text(
                note.datetime,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
