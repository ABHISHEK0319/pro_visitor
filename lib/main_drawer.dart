import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //This Navigation Drawer contain all drawer elements......
    return Drawer(
      //..................Start Column................
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,

            //this column contain circle Image, Name and mail.....
            child: Column(
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                const Text(
                  'Young Man',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'xyz@mail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          //Start......ListTile.............

          //Drawer Buttons define with icon and text.........
          //all buttons are define here..
          //and also tap the buttons then call (onTap method..)

          //For Calendar..........
          const ListTile(
            minVerticalPadding: 15.0,
            leading: Icon(
              Icons.event, //Icon......
              color: Color.fromARGB(255, 41, 184, 46),
              size: 24.0,
              semanticLabel: 'Calendar Page',
            ),
            title: Text(
              'Calendar', //Text..........
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),

          //For To_Do..........
          const ListTile(
            minVerticalPadding: 15.0,
            leading: Icon(
              Icons.call_to_action_rounded, //Icon......
              color: Colors.pinkAccent,
              size: 24.0,
              semanticLabel: 'ToDo Page',
            ),
            title: Text(
              'To Do', //Text..........
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),

          //For Meeting .........
          const ListTile(
            minVerticalPadding: 15.0,
            leading: Icon(
              Icons.meeting_room_outlined, //Icon......
              color: Colors.orange,
              size: 24.0,
              semanticLabel: 'Meetings Page',
            ),
            title: Text(
              'Meetings', //Text..........
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),

          //For Appointments.......
          const ListTile(
            minVerticalPadding: 15.0,
            leading: Icon(
              Icons.book_online, //Icon......
              color: Colors.redAccent,
              size: 24.0,
              semanticLabel: 'Appointment Page',
            ),
            title: Text(
              'Appointment', //Text..........
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),

          //For Contacts.........
          const ListTile(
            minVerticalPadding: 15.0,
            leading: Icon(
              Icons.contacts, //Icon......
              color: Colors.blue,
              size: 24.0,
              semanticLabel: 'Contacts Page',
            ),
            title: Text(
              'Contacts', //Text..........
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),

          //For Employees.....
          const ListTile(
            minVerticalPadding: 15.0,
            leading: Icon(
              Icons.people, //Icon......
              color: Color.fromARGB(255, 54, 69, 77),
              size: 32.0,
              semanticLabel: 'Employees Page',
            ),
            title: Text(
              'Employees', //Text..........
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),

          //For LogOut.....
          const ListTile(
            dense: true,
            contentPadding: EdgeInsets.only(top: 260.0, left: 160.0),
            leading: Icon(
              Icons.logout_rounded, //Icon......
              color: Colors.red,
              size: 32.0,
              semanticLabel: 'Person LogOut',
            ),
            title: Text(
              'LogOut', //Text..........
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: null,
          ),

          //Ends ListTile......
        ],
      ),

      //..........................End Column.................
    );
  }
}
