import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class MyContactActivity extends StatefulWidget {
  const MyContactActivity({Key? key}) : super(key: key);

  @override
  State<MyContactActivity> createState() => _ContactsState();
}

class _ContactsState extends State<MyContactActivity> {
  late List<Contact> listContact = [];
  late List<Contact> listContactFiltered = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllContacts();
    searchController.addListener(() {
      getFilteredList(searchController.text.toString());
    });
  }

  // String flattenPhoneNumber(String phoneStr) {
  //   return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
  //     return m[0] == "+" ? "+" : "";
  //   });
  // }

  getAllContacts() async {
    listContact =
        (await ContactsService.getContacts(withThumbnails: false)).toList();
    setState(() {
      listContactFiltered = listContact;
    });
    print(listContactFiltered.length);
  }

  void getFilteredList(String index) {
    if (index.isNotEmpty) {
      listContactFiltered =
          listContact.where((o) => o.displayName! == index).toList();
    } else {
      listContactFiltered = listContact;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                prefixIcon:
                    Icon(Icons.search, color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listContactFiltered.length,
                itemBuilder: (context, index) {
                  // Contact contact = isSearching == true
                  //     ? contactsFiltered[index]
                  //     : contacts[index];
                  return ListTile(
                    title: Text(listContactFiltered[index].displayName!),
                    subtitle: Text(
                        listContactFiltered[index].phones!.elementAt(0).value!),
                    leading: (listContactFiltered[index].avatar != null &&
                            (listContactFiltered[index].avatar)!.isNotEmpty)
                        ? CircleAvatar(
                            backgroundImage:
                                MemoryImage(listContactFiltered[index].avatar!),
                          )
                        : CircleAvatar(
                            child: Text(
                              listContactFiltered[index].initials(),
                            ),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
