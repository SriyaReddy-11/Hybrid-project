import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotelreservation/Login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({Key? key}) : super(key: key);

  @override
  _resetPasswordState createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {

  final _auth = FirebaseAuth.instance;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context)
  {
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

    final resetField = Material(
      child: MaterialButton(
        onPressed: () {
          if(_formKey.currentState!.validate()) {
            reset(emailController.text);
          }
        },
        color: Colors.blue,
        child: Text(
          'Reset',
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
                  Navigator.pushNamed(context, '/login');
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
                          padding: const EdgeInsets.only(top: 25, bottom: 48,left: 35),
                          child: Text(
                            ('Fill the details to reset your password'),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        Container(
                          width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: emailField
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                          child: resetField
                        ),
                      ]
                  ),
                ),
              ),
            )
        )
    );
  }

  // We will only use the user email to verify and send rest link
  Future<void> reset(String email) async {

    await _auth
    // we will directly send mail to their mail to reset
        .sendPasswordResetEmail(email: email)
        .then((uid) => {
      Fluttertoast.showToast(msg: "Check your E-mail for reset"),
      // Navigator.push(context,
      //   MaterialPageRoute(builder: (context) => Login()),
      //),
    })
        .catchError((e) {

      Fluttertoast.showToast(msg: e!.message);
    });

  }

// void navigateToNextScreen(BuildContext context) {
//   Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
// }
}
