import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class hotelDetails extends StatefulWidget {
  const hotelDetails({Key? key}) : super(key: key);

  @override
  _hotelDetailsState createState() => _hotelDetailsState();
}

class _hotelDetailsState extends State<hotelDetails> {
  String buttonText = "Book";
  bool isChanged = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: RaisedButton(
          color: Colors.redAccent,
          child: Icon(
            Icons.share,
            color: Color(0xffCCCCCC),
          ),
          onPressed: () {},
        ),
