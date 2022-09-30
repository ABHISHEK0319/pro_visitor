import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/meeting_folder/meeting_page/model_meeting.dart';
import 'package:pro_visitor/db/database.dart';
import '../meet_model_dart.dart';
import '../meeting_dbhelper.dart';
import '../meeting_widget/meet_card_widget.dart';
import 'edit_meet_page.dart';
import 'meet_detail_page.dart';

class MeetingsPage extends StatefulWidget {
  const MeetingsPage({Key? key}) : super(key: key);

  @override
  State<MeetingsPage> createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> {
  late List<ModelMeeting> meetings = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshMeetings();
  }

  @override
  void dispose() {
    //DbHelper.close();

    super.dispose();
  }

  Future refreshMeetings() async {
    setState(() => isLoading = true);

    if (meetings.isNotEmpty) {
      meetings.clear();
    }
    // meetings = await MeetingsDatabase.instance.readAllMeeting();

    List<Map<String, dynamic>> rs = await DbHelper.queryAll("Meeting_Record");
    for (var i = 0; i < rs.length; i++) {
      meetings.add(
        ModelMeeting(
          meetId: rs[i]["meetId"],
          meetHeader: rs[i]["meetHeader"].toString(),
          meetDate: rs[i]["meetDate"].toString(),
          meetTime: rs[i]["meetTime"].toString(),
          meetContact: rs[i]["meetContact"].toString(),
          createdBy: rs[i]["createdBy"].toString(),
        ),
      );
    }
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
              : meetings.isEmpty
                  ? const Text(
                      'No Meetings',
                      style: TextStyle(color: Color(0xff3FC120), fontSize: 24),
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
        /*ListView: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,*/
        itemBuilder: (context, index) {
          final meeting = meetings[index];

          return GestureDetector(
            onTap: () async {
              int i = int.parse(meetings[index].meetId.toString());
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MeetDetailPage(meetId: i),
              ));
              refreshMeetings();
            },
            child: MeetCardWidget(
              meeting: meeting,
              index: index,
            ),
          );
        },
      );
}
