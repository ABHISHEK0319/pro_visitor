import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/Appoint_Folder/appoint_models/appoint_data.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/Appoint_Folder/appoint_page/appoint_add_edit_page.dart';
import 'package:pro_visitor/db/database.dart';

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

    appoint_data = await DbHelper.instance.readAppoints(widget.appointId);

    //this.appoint_data =
    //    await AppointDatabase.instance.readAppoints(widget.appointId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('View Appointment'),
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
                      appoint_data.appointname,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      appoint_data.appointdatetime,
                      //DateFormat.yMMMd().format(note.createdTime),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      appoint_data.appointcontact,
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 18.0),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      appoint_data.appointreason,
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
          builder: (context) => AppointAddEditPage(appoint: appoint_data),
        ));

        refreshAppoint();
      });

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          await DbHelper.deleteData("Appointments_Record", "appointid = ?", [
            appoint_data.appointid
          ]).whenComplete(() => Navigator.of(context).pop());
          //await AppointDatabase.instance.delete(widget.appointId);
        },
      );
}
