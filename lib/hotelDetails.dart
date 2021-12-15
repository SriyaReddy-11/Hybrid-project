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
                  image: AssetImage('images/wallpaper.jpg'),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hotel Plasa',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 20),
                      ),
                    ),
                    ListTile(
                      leading: MyBullet(),
                      title: Text(
                        'Parking',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: MyBullet(),
                      title: Text(
                        'Wifi',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: MyBullet(),
                      title: Text(
                        'Breakfast and lunch included',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: MyBullet(),
                      title: Text(
                        '2 beds',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: MyBullet(),
                      title: Text(
                        'Pets allowed',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 280),
                      child: RaisedButton(
                          color: Colors.blue.shade300,
                          child: Text(
                            buttonText,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            isChanged = !isChanged;
                            setState(
                                  () {
                                isChanged == true
                                    ? buttonText = "Book"
                                    : buttonText = "Cancel";
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.0,
      width: 12.0,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
