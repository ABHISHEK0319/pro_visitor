import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/Calendar/event_editing_page.dart';
import 'package:pro_visitor/Screens/Calendar/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../models/event_data_source.dart';
import 'tasks_widget_calendar.dart';

class CalendarActivity extends StatelessWidget {
  const CalendarActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const EventEditingActivity()),
          ),
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: const MyCalendar(),
      ),
    );
  }
}

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    final Size s = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 0,
              minWidth: 0,
              maxHeight: double.infinity,
              maxWidth: double.infinity,
            ),
            child: SizedBox(
              width: s.width,
              height: s.height * 0.78,
              child: SfCalendarTheme(
                data: SfCalendarThemeData(
                  timeTextStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                child: SfCalendar(
                  view: CalendarView.month,
                  dataSource: EventDataSource(events),
                  initialSelectedDate: DateTime.now(),
                  cellBorderColor: Colors.transparent,
                  backgroundColor: const Color.fromARGB(255, 241, 241, 243),
                  todayHighlightColor: Colors.green,
                  onLongPress: (details) {
                    final provider =
                        Provider.of<EventProvider>(context, listen: false);

                    provider.setDate(details.date!);
                    Future.delayed(Duration.zero, () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => const TasksWidgetCalendar(),
                      );
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
