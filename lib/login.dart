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
          title: Padding(
            padding: const EdgeInsets.only(left: 75.0),
            child: Text(
              'RentoGo',
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: FlatButton(
            color: Colors.redAccent,
            child: Icon(
              Icons.arrow_back,
              color: Color(0xffCCCCCC),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          actions: [
          ],
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/wallpaper.jpg'),
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.dstATop),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FractionallySizedBox(
                    widthFactor: 0.7,
                    child: RaisedButton(
                      color: Colors.redAccent.withOpacity(0.1),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset('images/facebook-logo.png'),),
                          ),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 30),
                  child: Text(
                    'Or use your RentoGo credentials',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                ),
                Container(
                  width: 260,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.red)
                        ),
                        labelText: 'Enter Name',
                        hintText: 'Enter Your User Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: 260,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.red)
                        ),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(onPressed: (){},
                    color: Colors.blue,
                    child: Text('Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, '/reset');
                },
                  child: Text('Forgot Password? Click here',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Image.asset('images/log.gif'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
