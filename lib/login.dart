import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.red)
          ),
          labelText: 'Enter Name',
          hintText: 'Enter Your User Name'
      ),
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if(value!.isEmpty)
        {
          return "Please enter your Email Address";
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
        {
          return("Please enter a valid Email Address");
        }
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    final passwordField = TextFormField(
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
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        RegExp regexp = new RegExp(r'^.{6,}$');
        if(value!.isEmpty)
        {
          return "Please enter your Password";
        }
        if(!regexp.hasMatch(value))
        {
          return("Please enter a valid Password");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );

    final loginButton = Material(
      child: RaisedButton(onPressed: (){
        Navigator.pushNamed(context, '/screen');
      },
        color: Colors.blue,
        child: Text('Sign In',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );

    final forgotButton = Material(

      child: TextButton(onPressed: (){
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
    );



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
                            width: 180,
                            child: Text(
                              'Sign in with Facebook',
                              style: TextStyle(
                                  fontSize: 17,
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
                  child: emailField,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Container(
                    width: 260,
                    child: passwordField,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: loginButton,
                ),

                forgotButton,
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

  void signIn(String email, String password)  async
  {
    if(_formKey.currentState!.validate())
    {

      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {Fluttertoast.showToast(msg: "Login SuccessFull"),
        Navigator.push(context, MaterialPageRoute(builder: (context) => home()),),
      }).catchError((e)
      {
        Fluttertoast.showToast(msg: e!.message);
      });

    }
  }

}
