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
             )
    );
  }
  
}
