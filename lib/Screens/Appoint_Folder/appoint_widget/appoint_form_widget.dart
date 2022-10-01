import 'package:flutter/material.dart';

class AppointFormWidget extends StatelessWidget {
  final String? name;
  final String? datetime;
  final String? contact;
  final String? reason;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedDatetime;
  final ValueChanged<String> onChangedContact;
  final ValueChanged<String> onChangedReason;

  const AppointFormWidget({
    Key? key,
    this.name = '',
    this.datetime = '',
    this.contact = '',
    this.reason = '',
    required this.onChangedName,
    required this.onChangedDatetime,
    required this.onChangedContact,
    required this.onChangedReason,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildName(),
              const SizedBox(height: 8),
              buildDatetime(),
              const SizedBox(height: 8),
              buildContact(),
              const SizedBox(height: 8),
              buildReason(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );

  Widget buildName() => TextFormField(
        maxLines: 1,
        initialValue: name,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          border: OutlineInputBorder(),
          hintText: 'Name',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The Name cannot be empty' : null,
        onChanged: onChangedName,
      );
  Widget buildDatetime() => TextFormField(
        maxLines: 1,
        initialValue: datetime,
        style: const TextStyle(
          color: Colors.black,
          //fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.date_range_outlined),
          border: OutlineInputBorder(),
          hintText: 'Datetime',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The datetime cannot be empty'
            : null,
        onChanged: onChangedDatetime,
      );

  Widget buildContact() => TextFormField(
        keyboardType: TextInputType.phone,
        maxLines: 1,
        initialValue: contact,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.call),
          border: OutlineInputBorder(),
          hintText: 'Contact',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The Contact cannot be empty'
            : null,
        onChanged: onChangedContact,
      );

  Widget buildReason() => TextFormField(
        maxLines: 3,
        initialValue: reason,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.description_outlined),
          border: OutlineInputBorder(),
          hintText: 'Reason',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The Reason cannot be empty'
            : null,
        onChanged: onChangedReason,
      );
}
