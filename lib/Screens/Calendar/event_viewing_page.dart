import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/Calendar/event_provider.dart';
import 'package:provider/provider.dart';
// import 'package:pro_visitor/CustomUi/utils.dart';
// import 'package:pro_visitor/Screens/Calendra/event_editing_page.dart';
// import 'package:pro_visitor/Screens/Calendra/event_provider.dart';
// import 'package:provider/provider.dart';

import '../../db/database.dart';
import '../../models/event_model.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;
  const EventViewingPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        actions: [deleteButton(context)],
        // actions: buildViewingActions(context, event),
      ),
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: <Widget>[
          buildDateTime(event),
          const SizedBox(
            height: 32,
          ),
          Text(
            event.calTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            event.calDescription,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-day' : 'Form', event.from),
        if (!event.isAllDay) buildDate('To', event.to),
      ],
    );
  }

  Widget buildDate(String title, DateTime date) {
    return Container(
      child: Column(
        children: [
          Text(
            event.calTitle,
          ),
          Text(
            event.from.toIso8601String(),
          ),
        ],
      ),
    );
  }

  // List<Widget> buildViewingActions(context, Event event) {
  //   IconButton(
  //     icon: const Icon(Icons.edit),
  //     onPressed: () => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //           builder: (context) => EventEditingActivity(event: event)),
  //     ),
  //   );
  //   IconButton(
  //     icon: const Icon(Icons.delete),
  //     onPressed: () {
  //       final provider = Provider.of<EventProvider>(context, listen: false);
  //       provider.deleteEvent(event);
  //     },
  //   );
  // }

  Widget deleteButton(context) => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          final provider = Provider.of<EventProvider>(context, listen: false);

          provider.deleteEvent(event);
          await DbHelper.deleteData("Todo_Record", "id = ?", [event.calId])
              .whenComplete(() => Navigator.of(context).pop());
          // await NotesDatabase.instance.delete(widget.noteId);
        },
      );
}
