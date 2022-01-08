import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelreservation/Home.dart';
import 'package:hotelreservation/cancellation.dart';
import 'package:hotelreservation/hotelDetails.dart';
import 'package:hotelreservation/hotelScreen.dart';
import 'package:hotelreservation/resetPassword.dart';
import 'CreateAccount.dart';
import 'Login.dart';
import 'bookingConfirmation.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp()
  );
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home' :(context) => home(),
        '/login' : (context) => Login(),
        '/reset' : (context) => resetPassword(),
        '/cancel' : (context) => cancellation(),
        '/confirm' : (context) => bookingConfirmation(),
        //'/splash' : (context) => Splash(),
        '/details' : (context) => hotelDetails(),
        '/screen' : (context) => hotelScreen(),
        '/account' : (context) => CreateAccount(),

      },
    );
  }
}
