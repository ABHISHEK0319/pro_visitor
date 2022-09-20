import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/my_profile.dart';
import 'package:pro_visitor/bottom_nav_bar.dart';
import 'package:pro_visitor/pages/login_otp.dart';
import 'package:pro_visitor/pages/login_phone.dart';
import 'package:provider/provider.dart';
import 'Screens/Calendra/event_provider.dart';
// import 'config/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Firebase.initializeApp();

  // runApp(MaterialApp(
  //   initialRoute: 'phone',
  //   routes: {
  //     'phone': (context) => const MyPhone(),
  //     'otp': (context) => const MyOtp(),
  //     'profile': (context) => const MyProfile(),
  //   },
  // ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: 'phone',
        // routes: {
        //   'phone': (context) => const MyPhone(),
        //   'otp': (context) => const MyOtp(),
        //   'profile': (context) => const MyProfile(),
        // },
        title: 'Welcome to Visitor Log',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Visitor Log'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                tooltip: 'Settings',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('This is a snackbar'),
                      duration: Duration(milliseconds: 1500),
                      width: 280.0, // Width of the SnackBar.
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0, // Inner padding for SnackBar content.
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: const MyBottomNavBar(),
        ),
      ),
    );
  }
}
