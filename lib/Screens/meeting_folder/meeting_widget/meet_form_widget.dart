import 'package:flutter/material.dart';

class MeetFormWidget extends StatelessWidget {
  final String? title;
  final String? date;
  final String? time;
  final String? myContact;
  final String? createdBy;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDate;
  final ValueChanged<String> onChangedTime;
  final ValueChanged<String> onChangedMyContact;
  final ValueChanged<String> onChangedCreatedBy;

  const MeetFormWidget({
    Key? key,
    this.title = '',
    this.date = '',
    this.time = '',
    this.myContact = '',
    this.createdBy = '',
    required this.onChangedTitle,
    required this.onChangedDate,
    required this.onChangedTime,
    required this.onChangedMyContact,
    required this.onChangedCreatedBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              const SizedBox(height: 8),
              buildDate(),
              const SizedBox(height: 8),
              buildTime(),
              const SizedBox(height: 8),
              buildMyContact(),
              const SizedBox(height: 8),
              buildCreatedBy(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.title),
          border: OutlineInputBorder(),
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedTitle,
      );

  Widget buildDate() => TextFormField(
        maxLines: 1,
        initialValue: date,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.date_range_outlined),
          border: OutlineInputBorder(),
          hintText: 'date',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The time cannot be empty' : null,
        onChanged: onChangedDate,
      );
  Widget buildTime() => TextFormField(
        maxLines: 1,
        initialValue: time,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.timelapse_outlined),
          border: OutlineInputBorder(),
          hintText: 'time',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The time cannot be empty' : null,
        onChanged: onChangedTime,
      );

  Widget buildMyContact() => TextFormField(
        maxLines: 1,
        initialValue: myContact,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.call),
          border: OutlineInputBorder(),
          hintText: 'MyContact',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedMyContact,
      );

  Widget buildCreatedBy() => TextFormField(
        maxLines: 1,
        initialValue: createdBy,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          border: OutlineInputBorder(),
          hintText: 'CreatedBy',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The createdBy cannot be empty'
            : null,
        onChanged: onChangedCreatedBy,
      );
}
