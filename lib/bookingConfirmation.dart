import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bookingConfirmation extends StatefulWidget {
  const bookingConfirmation({Key? key}) : super(key: key);

  @override
  _bookingConfirmationState createState() => _bookingConfirmationState();
}

// To show a message that the hotel is booked and allow him to continue to browse further
class _bookingConfirmationState extends State<bookingConfirmation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: FlatButton(
          color: Colors.redAccent,
          child: Icon(
            Icons.arrow_back,
            color: Color(0xffCCCCCC),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/details');
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RentoGo',
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
