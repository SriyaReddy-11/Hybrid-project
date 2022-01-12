import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'hotelScreen.dart';
import 'login.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  final _auth = FirebaseAuth.instance;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // We will use this to define detail about each field including decoration
  // We will use only these names in the design
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController repasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final nameField = TextFormField(
      decoration: InputDecoration(
          border:
          OutlineInputBorder(borderSide: new BorderSide(color: Colors.red)),
          labelText: 'Enter Name',
          hintText: 'Enter Your User Name'),
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your Name";
        }
      },
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    final emailField = TextFormField(
      decoration: InputDecoration(
          border:
          OutlineInputBorder(borderSide: new BorderSide(color: Colors.red)),
          labelText: 'Enter Email',
          hintText: 'Enter Your E-mail'),
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your Email Address";
        }
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
      textInputAction: TextInputAction.next,
    );

    final repasswordField = TextFormField(
      decoration: InputDecoration(
        border:
        OutlineInputBorder(borderSide: new BorderSide(color: Colors.red)),
        labelText: 'Re- enter Password',
        hintText: 'Confirm Password',
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      autofocus: false,
      obscureText: true,
      controller: repasswordController,
      validator: (value) {
        RegExp regexp = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Please re-enter your Password";
        }
        //checking if both passwords are same or not
        if(passwordController.text != value){
          return "Confirm password does not match with password";
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


    final createButton = Material(
      child: MaterialButton(
        onPressed: () {
          if(_formKey.currentState!.validate()) {
            create(emailController.text, passwordController.text);
          }
        },
        color: Colors.blue,
        child: Text(
          'Create Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
                    Colors.black.withOpacity(0.4), BlendMode.dstATop),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                      child: nameField
                    ),
                  ),
                  Container(
                    width: 260,
                    child: emailField
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: 260,
                      child: passwordField
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: 260,
                      child: repasswordField
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: createButton
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  // Sign-in check and message
  Future<void> create(String email, String password) async {

      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Account Created SuccessFully"),
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => Login()),
        ),
      })
          .catchError((e) {

        Fluttertoast.showToast(msg: e!.message);
      });

  }
}
