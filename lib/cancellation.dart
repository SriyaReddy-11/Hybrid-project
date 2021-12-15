import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class cancellation extends StatefulWidget {
  const cancellation({Key? key}) : super(key: key);

  @override
  _cancellationState createState() => _cancellationState();
}

class _cancellationState extends State<cancellation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            leading: RaisedButton(
              color: Colors.redAccent,
              child: Icon(
                Icons.menu,
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
                  image: AssetImage('images/wallpaper.jpg'),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.dstATop),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Your reservation has been cancelled. \nLooking forward to seeing you again.',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text('Thank You',
                      style: TextStyle(
                        color: Colors.purple,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RaisedButton(
                        color: Colors.redAccent.shade100,
                        child: Text('Continue',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        onPressed: (){}
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
