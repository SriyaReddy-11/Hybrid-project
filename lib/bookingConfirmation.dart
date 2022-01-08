import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bookingConfirmation extends StatefulWidget {
  const bookingConfirmation({Key? key}) : super(key: key);

  @override
  _bookingConfirmationState createState() => _bookingConfirmationState();
}

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
        actions: [
          FlatButton(
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
              image: AssetImage('images/wallpaper.jpg'),
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              fit: BoxFit.cover),
        ),
        child: Column(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text('Your booking has been confirmed.',
              style: TextStyle(
                color: Colors.deepPurple,
                decorationColor: Colors.purple,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 38
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 32.0, 8.0, 20.0),
            child: Center(
              child: Text('Please click the button to continue browsing',
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                color: Colors.blue.shade300,
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/screen');
                }),
          ),
        ]),
      ),
    ));
  }
}
