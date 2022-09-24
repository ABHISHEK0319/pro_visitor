import 'package:flutter/material.dart';

class MyRegistrationPage extends StatefulWidget {
  const MyRegistrationPage({Key? key}) : super(key: key);

  @override
  State<MyRegistrationPage> createState() => _MyRegistrationPageState();
}

class _MyRegistrationPageState extends State<MyRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        // color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/formregi.gif',
                  width: 200.0,
                  height: 200.0,
                ),
                const SizedBox(height: 15),
                const Text(
                  'Registration',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const SizedBox(height: 15),
                // const Text(
                //   'We need to register your phone before getting started!',
                //   style: TextStyle(
                //     fontSize: 16,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                const SizedBox(height: 30),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: const [
                        SizedBox(width: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Expanded(
                            child: TextField(
                              // inputFormatters: <TextInputFormatter>[
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Name'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: const [
                        SizedBox(width: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Expanded(
                            child: TextField(
                              // inputFormatters: <TextInputFormatter>[
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Email'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: const [
                        SizedBox(width: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Expanded(
                            child: TextField(
                              // inputFormatters: <TextInputFormatter>[
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Number'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: const [
                        SizedBox(width: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Expanded(
                            child: TextField(
                              // inputFormatters: <TextInputFormatter>[
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Organization'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'phone');
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, 'profile', (route) => false);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const MyProfile()),);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
