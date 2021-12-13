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
        actions: [
          RaisedButton(
            color: Colors.redAccent,
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              radius: 20,
              child: Icon(
                Icons.person,
                color: Color(0xffCCCCCC),
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 370,
                    height: 240,
                    child: Image.asset(
                      'images/hotel1.JPG',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
