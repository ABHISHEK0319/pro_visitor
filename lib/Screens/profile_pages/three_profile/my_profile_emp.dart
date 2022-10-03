import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/profile_pages/contact_list_page.dart';
import 'package:pro_visitor/Screens/profile_pages/faqs.dart';
import 'package:pro_visitor/Screens/profile_pages/privacypolicy.dart';
// import 'package:googlesign/signup.dart';

class MyProfileEmpActivity extends StatelessWidget {
  const MyProfileEmpActivity({Key? key}) : super(key: key);

//   get child => null;

// class _MyProfileActivity extends StatelessWidget<_MyProfileActivity> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  // signOut() async {
  // await auth.signOut();
  // Navigator.pushReplacement(
  // context, MaterialPageRoute(builder: (context) => SignInScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    // final screenweight = MediaQuery.of(context).size.width;
    // final screenheight = MediaQuery.of(context).size.height

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 0,
                  ),
                  const Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/hero.jpg'),
                      radius: 60.0,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    '+91 0123456789',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    'name@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                      //height: 0,
                      ),

                  Container(
                    width: 280,
                    height: 50,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.privacy_tip),
                      label: Row(
                        children: const [
                          Center(
                            child: Text('Privacy & Policy'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 80),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PrivacyPolicy()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: const Size(280, 50),
                        primary: const Color.fromARGB(255, 230, 237, 240),
                        onPrimary: Colors.black,
                      ),
                    ),
                  ),

                  // Container(
                  //   width: 280,
                  //   height: 50,
                  //   alignment: Alignment.center,
                  //   padding: const EdgeInsets.all(5),
                  //   child: ElevatedButton.icon(
                  //     icon: const Icon(Icons.support_agent),
                  //     label: Row(
                  //       children: const [
                  //         Center(child: Text("Help & Support")),
                  //         Padding(
                  //           padding: EdgeInsets.only(left: 87),
                  //           child: Icon(Icons.arrow_forward_ios),
                  //         ),
                  //       ],
                  //     ),
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30.0),
                  //       ),
                  //       minimumSize: const Size(280, 40),
                  //       primary: const Color.fromARGB(255, 230, 237, 240),
                  //       onPrimary: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: 280,
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.contacts),
                      label: Row(
                        children: const [
                          Center(child: Text("Contact")),
                          Padding(
                            padding: EdgeInsets.only(left: 130),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyContact()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: const Size(280, 40),
                        primary: const Color.fromARGB(255, 230, 237, 240),
                        onPrimary: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 280,
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.share),
                      label: Row(
                        children: const [
                          Center(child: Text("Refer")),
                          Padding(
                            padding: EdgeInsets.only(left: 147),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: const Size(280, 40),
                        primary: const Color.fromARGB(255, 230, 237, 240),
                        onPrimary: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 280,
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.question_answer),
                      label: Row(
                        children: const [
                          Center(child: Text("FAQs")),
                          Padding(
                            padding: EdgeInsets.only(left: 147),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Faqs()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: const Size(280, 40),
                        primary: const Color.fromARGB(255, 230, 237, 240),
                        onPrimary: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 280,
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.logout),
                      label: Row(
                        children: const [
                          Center(child: Text("Log Out")),
                          Padding(
                            padding: EdgeInsets.only(left: 130.0),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                      onPressed: () {
                        // signOut();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: const Size(280, 40),
                        primary: const Color.fromARGB(255, 230, 237, 240),
                        onPrimary: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
