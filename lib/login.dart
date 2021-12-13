import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Center(
            child: Text(
              'RentoGo',
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.dstATop),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: RaisedButton(
                    color: Colors.white70,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset('images/googlelogo.jpg'),),
                          SizedBox(
                            child: Text(
                            'Sign in with Google',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                        ),
                          )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 40),
                  child: Text(
                    'Or use your RentoGo credentials',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                ),
