import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelreservation/Login.dart';

class resetPassword extends StatefulWidget {
 const resetPassword({Key? key}) : super(key: key);

  @override
  _resetPasswordState createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
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
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.red)),
                                labelText: 'Enter E-mail',
                                hintText: 'Enter Your E-mail'),
                          ),
                        ),
                      ),
                     Container(
                        width: 260,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.red)),
                              labelText: 'New Password',
                              hintText: 'Enter Your new password'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Container(
                          width: 260,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.red)),
                                labelText: 'Re-enter Password',
                                hintText: 'Confirm password'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                        child: RaisedButton(
                          color: Colors.blue.shade300,
                          child: Text('Reset Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: (){
                            //navigateToNextScreen(context);
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      ),
                    ]
                ),
              ),
            )
             )
    );
  }
  
}
