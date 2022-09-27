import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_models/appoint_data.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_Database/appoint_dbhelper.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_models/appoint_data.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_page/appoint_add_edit_page.dart';

class AppointDetailPage extends StatefulWidget {
  final int appointId;

  const AppointDetailPage({
    Key? key,
    required this.appointId,
  }) : super(key: key);

  @override
  AppointDetailPageState createState() => AppointDetailPageState();
}

class AppointDetailPageState extends State<AppointDetailPage> {
  late Appoint_Data appoint_data;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshAppoint();
  }

  Future refreshAppoint() async {
    setState(() => isLoading = true);

    this.appoint_data = await AppointDatabase.instance.readAppoints(widget.appointId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('View Appointment'),
          titleTextStyle: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            ),
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      appoint_data.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      appoint_data.datetime,
                      //DateFormat.yMMMd().format(note.createdTime),
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      appoint_data.contact,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      appoint_data.reason,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0
                      ),
                    )
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AppointAddEditPage(appoint: appoint_data),
        ));

        refreshAppoint();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await AppointDatabase.instance.delete(widget.appointId);

          Navigator.of(context).pop();
        },
      );
}