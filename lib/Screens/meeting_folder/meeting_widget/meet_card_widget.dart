import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/meeting_folder/meeting_models/meet_model_dart.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class MeetCardWidget extends StatelessWidget {
  const MeetCardWidget({
    Key? key,
    required this.meeting,
    required this.index,
  }) : super(key: key);

  final Meeting meeting;
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
                meeting.meetTitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Expanded(
                child: Row(
                  children: [
                    Text(
                      meeting.meetDate,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                    // Text(
                    //   meeting.meetTime,
                    //   style: const TextStyle(
                    //     color: Colors.black87,
                    //     fontSize: 18,
                    //   ),
                    // ),
                  ],
                ),
              ),
              // trailing: Text(
              //   meeting.createdBy,
              //   style: const TextStyle(
              //     color: Colors.black,
              //     fontSize: 18.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   textAlign: TextAlign.right,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
