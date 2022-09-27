import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/Todo%20folder/todo_page/note_page.dart';
import 'package:pro_visitor/Screens/Calendar/calendar.dart';
import 'package:pro_visitor/Screens/meeting_folder/meeting_page/meet_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Appoint_Folder/appoint_page/appoint_list_page.dart';
import 'Screens/my_profile.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

// Here I'm define bottom nav indexing through the selectedIndex value or Methods..
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// Define list of pages/Methods like calendar, todo, etc......... are call here.
  final List<Widget> _pages = [
    const CalendarActivity(),
    const NotesPage(),
    const MeetingsPage(),
    const AppointListPage(),
  ];

// Here my build method and define all widgets..........
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Visitor Log'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            tooltip: 'Profile',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyProfile(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'OnboardingScreen',
            onPressed: () async {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'OnboardingPage', (route) => false);

              //navigate directly to home page..
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', false);
            },
          ),
        ],
      ),

      body: _pages[_selectedIndex],

      //Define my bottom Navigation code.......
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        //type: BottomNavigationBarType.fixed,

        // and also define bottom navigation items...........
        items: const [
          //Here calendar item...
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Calendar',
            backgroundColor: Color.fromARGB(255, 89, 124, 231),
          ),
          //Here ToDo item.......
          BottomNavigationBarItem(
            icon: Icon(Icons.call_to_action_rounded),
            label: 'To Do',
            backgroundColor: Color.fromRGBO(63, 193, 32, 1),
          ),
          //Here Meeting item.....
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room_outlined),
            label: 'Meetings',
            backgroundColor: Color.fromRGBO(255, 152, 0, 1),
          ),
          //Here Appointment item...
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Appointment',
            backgroundColor: Color.fromRGBO(235, 64, 52, 1),
          ),
        ],
      ),
    );
  }
}
