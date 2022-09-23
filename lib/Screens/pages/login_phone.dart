import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";

  @override
  void initState() {
    super.initState();
    countrycode.text = '+91';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/login.gif',
                  width: 200.0,
                  height: 200.0,
                ),
                const SizedBox(height: 15),
                const Text(
                  'Phone Verification',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'We need to register your phone before getting started!',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 40,
                          child: TextField(
                            controller: countrycode,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6),
                          child: Text(
                            '|',
                            style: TextStyle(fontSize: 34, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              phone = value;
                            },
                            keyboardType: TextInputType.phone,
                            // inputFormatters: <TextInputFormatter>[
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: 'Phone'),
                          ),
                        )
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
                      //async {
                      //   await FirebaseAuth.instance.verifyPhoneNumber(
                      //     phoneNumber: '${countrycode.text + phone}',
                      //     verificationCompleted:
                      //         (PhoneAuthCredential credential) {},
                      //     verificationFailed: (FirebaseAuthException e) {},
                      //     codeSent: (String verificationId, int? resendToken) {
                      //       MyPhone.verify = verificationId;
                      //       Navigator.pushNamed(context, 'otp');
                      //     },
                      //     codeAutoRetrievalTimeout: (String verificationId) {},
                      //   );
                      Navigator.pushNamed(context, 'otp');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Send the code',
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
