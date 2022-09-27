import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_models/appoint_data.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class AppointCardWidget extends StatelessWidget {
  AppointCardWidget({
    Key? key,
    required this.appoint,
    required this.index,
  }) : super(key: key);

  final Appoint_Data appoint;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    //final time = DateFormat.yMMMd().format(note.datetime);
    //final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        //constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            ListTile(
            leading: Icon(Icons.description_outlined),
            title: Text(
              appoint.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                ),
            ),
            //SizedBox(height: 4),
            subtitle: Text(
              appoint.datetime,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
            trailing: Text(
              appoint.contact,
              style: TextStyle(
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