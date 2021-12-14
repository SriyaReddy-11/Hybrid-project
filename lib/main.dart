import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotelreservation/Home.dart';
import 'package:hotelreservation/cancellation.dart';
import 'package:hotelreservation/hotelDetails.dart';
import 'package:hotelreservation/hotelScreen.dart';
import 'package:hotelreservation/resetPassword.dart';
import 'CreateAccount.dart';
import 'Login.dart';
import 'Splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import 'Splash.dart';

void main() {
  runApp( MyApp(),
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
        //'/splash' : (context) => Splash(),
        '/details' : (context) => hotelDetails(),
        '/screen' : (context) => hotelScreen(),
        '/account' : (context) => CreateAccount(),

      },
    );
  }
}
