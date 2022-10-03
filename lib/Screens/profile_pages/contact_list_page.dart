import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:typed_data';

class MyContact extends StatefulWidget {
  const MyContact({Key? key}) : super(key: key);

  get name => null;

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  List<Contact>? contacts;

  @override
  void initState() {
    super.initState();
    getPhoneData();
  }

  void getPhoneData() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = (await FlutterContacts.getContacts(
              withProperties: true, withPhoto: true))
          .cast<Contact>();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'My Contact',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            /*actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (() {
                showSearch(
                  context: context,
                  delegate: MyContact(),
                );   
              })
            )
          ],*/
          ),
          body: (contacts == null)
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: contacts!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Uint8List? image = contacts![index].photo;
                    String number = (contacts![index].phones.isNotEmpty)
                        ? contacts![index]
                            .phones
                            .first
                            .number
                            .substring(0)
                            .toString()
                        : "---";
                    return ListTile(
                      leading: (image == null)
                          ? const CircleAvatar(
                              child: Icon(Icons.person),
                            )
                          : CircleAvatar(
                              backgroundImage: MemoryImage(image),
                            ),
                      title: Text(
                        contacts![index].name.first,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      subtitle: Text(number),
                      trailing: Column(
                        children: <Widget>[
                          Container(
                            child: IconButton(
                              icon: const Icon(Icons.call),
                              onPressed: () {
                                // ignore: deprecated_member_use
                                launch('tel: $number');
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
    );
  }
}
