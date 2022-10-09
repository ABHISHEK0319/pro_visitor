import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/meeting_folder/meeting_models/meet_model_dart.dart';
import 'package:pro_visitor/db/database.dart';
import '../meeting_widget/meet_card_widget.dart';
import 'edit_meet_page.dart';
import 'meet_detail_page.dart';

class MeetingsPage extends StatefulWidget {
  const MeetingsPage({Key? key}) : super(key: key);

  @override
  State<MeetingsPage> createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> {
  late List<Meeting> meetings = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshMeetings();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future refreshMeetings() async {
    setState(() => isLoading = true);

    // meetings = await MeetingsDatabase.instance.readAllMeeting();
    meetings = (await DbHelper.queryAll("Meetings_Record"))
        .map((json) => Meeting.fromJson(json))
        .toList();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : meetings.isEmpty
                  ? const Text(
                      'No Meetings',
                      style: TextStyle(color: Colors.orange, fontSize: 24),
                    )
                  : buildMeetings(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const AddEditMeetingPage()),
            );

            refreshMeetings();
          },
        ),
      );

  Widget buildMeetings() => ListView.builder(
        padding: const EdgeInsets.all(2),
        itemCount: meetings.length,
        itemBuilder: (context, index) {
          final meeting = meetings[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MeetDetailPage(meetId: meeting.meetId!),
              ));
              refreshMeetings();
            },
            child: MeetCardWidget(meeting: meeting, index: index),
          );
        },
      );
}
