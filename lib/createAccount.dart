import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 50),
                  child: Text(('Create Account'),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),),
                ),
                Container(
                  width: 260,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.red)
                          ),
                          labelText: 'Enter Name',
                          hintText: 'Enter Your User Name'),
                    ),
                  ),
                ),
                Container(
                  width: 260,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.red)
                        ),
                        labelText: 'E-Mail',
                        hintText: 'Enter Your E-mail'),
                  ),
                ),        
 ),
    );
  }
}
