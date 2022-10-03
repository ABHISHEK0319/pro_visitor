import 'package:flutter/material.dart';

class EmployeeFormWidget extends StatelessWidget {
  final String? name;
  final String? contact;
  final String? designation;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedContact;
  final ValueChanged<String> onChangedDesignation;

  const EmployeeFormWidget({
    Key? key,
    this.name = '',
    this.contact = '',
    this.designation = '',
    required this.onChangedName,
    required this.onChangedContact,
    required this.onChangedDesignation,
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
              buildDatetime(),
              const SizedBox(height: 8),
              buildDescription(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: name,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.title),
          border: OutlineInputBorder(),
          hintText: 'Name',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The name cannot be empty' : null,
        onChanged: onChangedName,
      );
  Widget buildDatetime() => TextFormField(
      maxLines: 1,
      initialValue: contact,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      decoration: const InputDecoration(
        icon: Icon(Icons.date_range_outlined),
        border: OutlineInputBorder(),
        hintText: 'contact',
        hintStyle: TextStyle(color: Colors.black38),
      ),
      validator: (title) =>
          title != null && title.isEmpty ? 'The contact cannot be empty' : null,
      onChanged: onChangedContact);

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: designation,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.description_outlined),
          border: OutlineInputBorder(),
          hintText: 'designation',
          hintStyle: TextStyle(color: Colors.black38),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The designation cannot be empty'
            : null,
        onChanged: onChangedDesignation,
      );
}
