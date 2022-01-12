import 'dart:io';
import 'dart:ui';

import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotelreservation/hotelScreen.dart';
import 'package:hotelreservation/facebookLogin.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // We will use only these names later
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      decoration: InputDecoration(
          border:
              OutlineInputBorder(borderSide: new BorderSide(color: Colors.red)),
          labelText: 'Enter Name',
          hintText: 'Enter Your User Name'),
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your Email Address";
        }
        // conditional requirements for the mail
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid Email Address");
        }
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    final passwordField = TextFormField(
      decoration: InputDecoration(
        border:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.red)),
        labelText: 'Password',
        hintText: 'Enter Password',
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        //conditional requirements for password
        RegExp regexp = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Please enter your Password";
        }
        if (!regexp.hasMatch(value)) {
          return ("Please enter a valid Password");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );

    final loginButton = Material(
      child: MaterialButton(
        onPressed: () {
          if(_formKey.currentState!.validate()) {
            signIn(emailController.text, passwordController.text);
          }
        },
        color: Colors.blue,
        child: Text(
          'Sign In',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );

    final forgotButton = Material(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/reset');
        },
        child: Text(
          'Forgot Password? Click here',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );

   
