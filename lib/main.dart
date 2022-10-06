// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_visitor/bottom_nav_bar.dart';
import 'package:pro_visitor/onBoardingScreens/welcome_pages.dart';
import 'package:pro_visitor/pages/login_otp.dart';
import 'package:pro_visitor/pages/login_phone.dart';
import 'package:pro_visitor/pages/registration.dart';
import 'package:pro_visitor/pages/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Calendar/event_provider.dart';
// import 'config/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //await Firebase.initializeApp();
  // runApp(MaterialApp(
  //   initialRoute: 'phone',
  //   routes: {
  //     'phone': (context) => const MyPhone(),
  //     'otp': (context) => const MyOtp(),
  //     'profile': (context) => const MyProfile(),
  //   },
  // ));

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: 'SplashScreen',
        // routes: {
        //   'SplashScreen': (context) => const SplashScreen(),
        //   'OnboardingPage': (context) => const OnboardingPage(),
        //   'registration': (context) => const MyRegistrationPage(),
        //   'phone': (context) => const MyPhone(),
        //   'otp': (context) => const MyOtp(),
        //   'MyBottomNav': (context) => const MyBottomNavBar(),
        // },
        title: 'Welcome to Visitor Log',
        home: Scaffold(
          // appBar: AppBar(
          //   title: const Text('Welcome to Visitor Log'),
          //   actions: <Widget>[
          //     IconButton(
          //       icon: const Icon(Icons.more_vert, color: Colors.white),
          //       tooltip: 'Settings',
          //       onPressed: () {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //             content: Text('This is a snackbar'),
          //             duration: Duration(milliseconds: 1500),
          //             width: 280.0, // Width of the SnackBar.
          //             padding: EdgeInsets.symmetric(
          //               horizontal: 8.0, // Inner padding for SnackBar content.
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ],
          // ),
          // body: showHome ? const MyRegistrationPage() : const OnboardingPage(),
          body: MyBottomNavBar(),
        ),
      ),
    );
  }
}
