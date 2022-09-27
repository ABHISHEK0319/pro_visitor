import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final String? title;
  final String? datetime;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDatetime;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    Key? key,
    this.title = '',
    this.datetime = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDatetime,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              SizedBox(height: 8),
              buildDatetime(),
              SizedBox(height: 8),
              buildDescription(),
              SizedBox(height: 8),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        
        maxLines: 1,
        initialValue: title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          icon: Icon(Icons.title),
          border: OutlineInputBorder(),
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 
            'The title cannot be empty' : null,
        onChanged: onChangedTitle,
      );
  Widget buildDatetime() => TextFormField(
        
        maxLines: 1,
        initialValue: datetime,
        style: TextStyle(
          color: Colors.black,
          //fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          icon: Icon(Icons.date_range_outlined),
          border: OutlineInputBorder(),
          hintText: 'datetime',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 
            'The datetime cannot be empty' : null,
        onChanged: onChangedDatetime,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: description,
        style: TextStyle(
          color: Colors.black, 
          fontSize: 20,
          ),
        decoration: InputDecoration(
          icon: Icon(Icons.description_outlined),
          border: OutlineInputBorder(),
          hintText: 'Description',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) => 
          title != null && title.isEmpty? 
          'The description cannot be empty' : null,
        onChanged: onChangedDescription,
  );
  
}