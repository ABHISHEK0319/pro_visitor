import 'package:flutter/material.dart';
import '../meet_model_dart.dart';
import '../meeting_dbhelper.dart';
import 'edit_meet_page.dart';

class MeetDetailPage extends StatefulWidget {
  final int meetId;

  const MeetDetailPage({
    Key? key,
    required this.meetId,
  }) : super(key: key);

  @override
  State<MeetDetailPage> createState() => _MeetDetailPageState();
}

class _MeetDetailPageState extends State<MeetDetailPage> {
  late Meeting meeting;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    meeting = await MeetingsDatabase.instance.readMeeting(widget.meetId);

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
                      meeting.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      meeting.date,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      meeting.time,
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 18.0),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      meeting.myContact,
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 18.0),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      meeting.createdBy,
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
          builder: (context) => AddEditMeetingPage(meeting: meeting),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          Navigator.of(context).pop();
          await MeetingsDatabase.instance.delete(widget.meetId);
        },
      );
}
