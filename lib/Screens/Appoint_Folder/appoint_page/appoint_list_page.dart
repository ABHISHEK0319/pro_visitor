import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_database/appoint_dbhelper.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_models/appoint_data.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_page/appoint_add_edit_page.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_widget/appoint_card_widget.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_page/appoint_detail_page.dart';

class AppointApp extends StatelessWidget {
  static const String title = 'Appoint SQLite';

  const AppointApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: const Color(0xffF44336),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xffF44336),
            elevation: 0,
          ),
        ),
        home: const AppointListPage(),
      );
}

class AppointListPage extends StatefulWidget {
  const AppointListPage({Key? key}) : super(key: key);

  @override
  AppointListPageState createState() => AppointListPageState();
}

class AppointListPageState extends State<AppointListPage> {
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
          title: const Text(
            'Welcome To Visitor Log',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          //actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : appoints.isEmpty
                  ? const Text(
                      'No Appointments',
                      style: TextStyle(color: Color(0xffF44336), fontSize: 24),
                    )
                  : buildAppoints(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffF44336),
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const AppointAddEditPage()),
            );
            refreshAppoints();
          },
        ),
      );

  Widget buildAppoints() => ListView.builder(
        padding: const EdgeInsets.all(2),
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
