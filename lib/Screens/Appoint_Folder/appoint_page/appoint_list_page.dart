import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_database/appoint_dbhelper.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_models/appoint_data.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_page/appoint_add_edit_page.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_widget/appoint_card_widget.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_page/appoint_detail_page.dart';


class AppointApp extends StatelessWidget {
  static final String title = 'Appoint SQLite';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Color(0xffF44336),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xffF44336),
            elevation: 0,
          ),
        ),
        home: Appoint_List_Page(),
      );
}

class Appoint_List_Page extends StatefulWidget {
  @override
  Appoint_List_PageState createState() => Appoint_List_PageState();
}

class Appoint_List_PageState extends State<Appoint_List_Page> {
  late List<Appoint_Data> appoints;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshAppoints();
  }

  @override
  void dispose() {
    AppointDatabase.instance.close();

    super.dispose();
  }

  Future refreshAppoints() async {
    setState(() => isLoading = true);

    this.appoints = await AppointDatabase.instance.readAllAppoints();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome To Visitor Log',
            style: TextStyle(fontSize: 24,
            fontWeight: FontWeight.bold,
            ),
          ),
          //actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : appoints.isEmpty
                  ? Text(
                      'No Appointments',
                      style: TextStyle(color: Color(0xffF44336), fontSize: 24),
                    )
                  : buildAppoints(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffF44336),
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AppointAddEditPage()),
            );
            refreshAppoints();
          },
        ),
      );

  Widget buildAppoints() => ListView.builder(
        padding: EdgeInsets.all(2),
        itemCount: appoints.length,
        itemBuilder: (context, index) {
          final appoint = appoints[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AppointDetailPage(appointId: appoint.id!),
              ));

              refreshAppoints();
            },
            child: AppointCardWidget(appoint: appoint, index: index),
          );
        },
      );
}