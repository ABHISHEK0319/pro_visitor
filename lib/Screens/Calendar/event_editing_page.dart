import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../CustomUi/utils.dart';
import '../../db/database.dart';
import '../../models/event_model.dart';
import 'event_provider.dart';

class EventEditingActivity extends StatefulWidget {
  final Event? event;
  const EventEditingActivity({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  State<EventEditingActivity> createState() => _EventEditingActivityState();
}

class _EventEditingActivityState extends State<EventEditingActivity> {
  late DateTime fromDate;
  late DateTime toDate;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    } else {
      final event = widget.event!;

      titleController.text = event.calTitle;
      fromDate = event.from;
      toDate = event.to;

      refreshNotes();
    }
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    // notes = await NotesDatabase.instance.readAllNotes();
    (await DbHelper.queryAll("Calendar_Record"))
        .map((json) => Event.fromJson(json));

    setState(() => isLoading = false);
  }

  @override
  void dispose() {
    titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        actions: buildEditingActions(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  buildTitle(),
                  const SizedBox(height: 12),
                  buildDateTimePickers(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildEditingActions() => <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              // shadowColor: Colors.blueAccent,
            ),
            onPressed: saveForm,
            icon: const Icon(Icons.done, color: Colors.black),
            label: const Text(
              'SAVE',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        )
      ];

  Widget buildTitle() => TextFormField(
        style: const TextStyle(fontSize: 24),
        decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            hintText: 'Add Tittle',
            hintStyle: TextStyle(
              color: Color.fromARGB(221, 123, 122, 122),
            )),
        onFieldSubmitted: (_) => saveForm(),
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot be empty' : null,
        controller: titleController,
      );

  Widget buildDateTimePickers() => Column(
        children: [
          buildForm(),
          buildTo(),
        ],
      );

  Widget buildForm() => buildHeader(
        header: 'From',
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: Utils.toDate(fromDate),
                onClicked: () => pickFromDateTime(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropdownField(
                text: Utils.toTime(fromDate),
                onClicked: () => pickFromDateTime(pickDate: false),
              ),
            ),
          ],
        ),
      );

  Widget buildTo() => buildHeader(
        header: 'To',
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: Utils.toDate(toDate),
                onClicked: () => pickToDateTime(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropdownField(
                text: Utils.toTime(toDate),
                onClicked: () => pickToDateTime(pickDate: false),
              ),
            ),
          ],
        ),
      );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.second);
    }

    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate: pickDate,
      firstDate: pickDate ? fromDate : null,
    );

    if (date == null) return;

    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2015, 8),
        lastDate: DateTime(2101),
      );

      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeOfDay == null) return null;

      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

      return date.add(time);
    }
  }

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Widget buildHeader({
    required String header,
    required Row child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
          child,
        ],
      );

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final event = Event(
        calTitle: titleController.text,
        //calDescription: 'Description',
        from: fromDate,
        to: toDate,
        isAllDay: false,
      );
      //final isEditing = widget.event != null;
      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);
      //await DbHelper.insertData("Calendar_Record", event.toJson());
      final db = await DbHelper.instance.getDatabase;
      await db.rawInsert(
          "INSERT INTO Calendar_Record ('CalTitle', 'From', 'To', 'isAllDay')  VALUES (?,?,?,?)",
          [
            event.calTitle,
            event.from.toString(),
            event.to.toString(),
            event.isAllDay
          ]).whenComplete(() => Navigator.of(context).pop());

      // if (isEditing) {
      //   provider.editEvent(event, widget.event!);

      //   Navigator.of(context).pop();
      // } else {
      //   provider.addEvent(event);
      // }

    }
  }
}
