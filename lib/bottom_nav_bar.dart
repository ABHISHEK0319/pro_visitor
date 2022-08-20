import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/appointments.dart';
import 'package:pro_visitor/Screens/calendar.dart';
import 'package:pro_visitor/Screens/meetings.dart';
import 'package:pro_visitor/Screens/to_do.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const CalendarActivity(),
    const ToDoActivity(),
    const MeetingActivity(),
    const AppointmentActivity(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        //type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Calendar',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_to_action_rounded),
            label: 'To Do',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room_outlined),
            label: 'Meetings',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Appointment',
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
