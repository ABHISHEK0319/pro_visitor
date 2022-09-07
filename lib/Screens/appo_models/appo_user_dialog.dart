import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/appo_models/appo_users.dart';

class add_appoint extends StatefulWidget {
  
  final Function(Appointment) Appoint_Dialog;

  add_appoint(this.Appoint_Dialog);

  @override
  State<add_appoint> createState() => _add_appointState();
}

class _add_appointState extends State<add_appoint> {

TextEditingController _AppointName = TextEditingController();
TextEditingController _AppointReason = TextEditingController();
TextEditingController _AppointDateTime = TextEditingController();
TextEditingController _AppointContact = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Widget buildTextfield(String hint, TextEditingController controller ){
      
      return Center(
        child: Container(
          margin: EdgeInsets.all(4.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: hint,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0XffF44336),
                ),
              ),
            ),
            controller: controller,
          ),
        ),
      );
    }
    return Center(
      child: Container(
        
        padding: EdgeInsets.all(8),
        height: 425,
        width: 500,
        child: Column(
          children: [
            Text(
              'Appointment',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0XffF44336),
              ),
              ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                TextField(
                  autofocus: true,
                  controller: _AppointName,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                    labelText: 'Name',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                TextField(
                  controller: _AppointReason,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.question_mark),
                    border: OutlineInputBorder(),
                    hintText: 'Reason',
                    labelText: 'Reason',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                TextField(
                  controller: _AppointDateTime,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_month_outlined),
                    border: OutlineInputBorder(),
                    hintText: 'Date & Time',
                    labelText: 'Date & Time',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                TextField(
                  controller: _AppointContact,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.contact_phone),
                    border: OutlineInputBorder(),
                    hintText: 'Contact',
                    labelText: 'Contact',
                  ),
                ),
            Padding(
                  padding: EdgeInsets.only(top: 25.0),
                ),
            RaisedButton(             //RaisedButton on alert diadlog
                    onPressed: (){
                      final appointment = Appointment(
                        _AppointName.text, 
                        _AppointReason.text,
                        _AppointDateTime.text,
                        _AppointContact.text,
                        );
                      widget.Appoint_Dialog(appointment);
                      Navigator.of(context).pop();
                    },
                    color: Color(0XffF44336),
                    child: Text(
                      "Request",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}