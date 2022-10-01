import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/meeting_folder/meeting_page/model_meeting.dart';
import 'package:pro_visitor/db/database.dart';
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
  late int id;
  late ModelMeeting meeting;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    id = widget.meetId;
    refreshMeeting();
  }

  Future refreshMeeting() async {
    setState(() => isLoading = true);

    final db = await DbHelper.instance.getDatabase;
    List<Map<String, dynamic>> rs =
        await DbHelper.querySearch("Meeting_Record", "meetId =?", [id]);

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
                      meeting.meetHeader,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      meeting.meetDate,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      meeting.meetTime,
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 18.0),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      meeting.meetContact,
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

        refreshMeeting();
      });

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          Navigator.of(context).pop();
          await DbHelper.deleteData("Meeting_Record", "meetId =?", [id]);
        },
      );
}
