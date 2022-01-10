import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotelreservation/cancellation.dart';
import 'package:firebase_database/firebase_database.dart';

import 'home.dart';
import 'dart:developer' as developer;

class hotelScreen extends StatefulWidget {
  const hotelScreen({Key? key}) : super(key: key);

  @override
  _hotelScreenState createState() => _hotelScreenState();
}

// class Hotels {
//   final dbRef = FirebaseDatabase.instance.reference();
//   Object hotels = [];
//   Hotels() {
//     fetchHotels();
//   }
//
//   void fetchHotels() async {
//     DataSnapshot snapshot = await dbRef.get();
//     hotels = snapshot.child('hotels').value as Object;
//     print("data : ${hotels}");
//   }
// }


class _hotelScreenState extends State<hotelScreen> {

  //final Future<Object> _future = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    // Hotels allHotels = new Hotels();
    // print("hotels ${allHotels.hotels}");
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
                Navigator.pushNamed(context, '/home');
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
              PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text('Bookings'),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        const SizedBox(width: 8),
                        Text('Sign Out'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          body:
          // FutureBuilder(
          //   future: _future,
          //   builder: (context, snapshot){
          //     if(snapshot.hasError){
          //       return Text(snapshot.error.toString());
          //     } else {
          //       developer.log('hotels : ${allHotels.hotels}');
          //       return
               Container(
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton<String>(
                            dropdownColor: Colors.blueAccent.shade100,
                            iconSize: 0,
                            items: <String>['Price low to high', 'Price high to low', 'latest'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},

                            hint: FlatButton(
                              minWidth: 15,
                              color: Colors.redAccent.shade100,
                              child: Icon(
                                Icons.sort,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          DropdownButton<String>(
                            dropdownColor: Colors.blueAccent.shade100,
                            iconSize: 2,
                            items: <String>['Rating', 'Price', 'Avaliability'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},

                            hint: FlatButton(
                              minWidth: 15,
                              color: Colors.redAccent.shade100,
                              child: Icon(
                                Icons.filter,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.asset('images/hotel1.JPG'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hotel Plasa: ',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                            Text('\$89',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Avaliable',
                              style: TextStyle(
                                  color: Colors.green.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: RaisedButton(onPressed: (){
                                Navigator.pushNamed(context, '/details');
                              },
                                color: Colors.blueAccent,
                                child: Text('Details',
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.asset('images/hotel2.JPG'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cristal: ',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                            Text('\$75',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Avaliable',
                              style: TextStyle(
                                  color: Colors.green.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: RaisedButton(onPressed: (){
                                Navigator.pushNamed(context, '/details');
                              },
                                color: Colors.blueAccent,
                                child: Text('Details',
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.asset('images/hotel3.JPG'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Holiday Inn: ',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                            Text('\$57',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(' Not Avaliable',
                              style: TextStyle(
                                  color: Colors.red.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: RaisedButton(onPressed: (){
                                Navigator.pushNamed(context, '/details');
                              },
                                color: Colors.blueAccent,
                                child: Text('Details',
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]
                ),
              ),
            )
            // }
            // },
          //)
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => cancellation()),
          //Navigator.pushNamed(context, '/screen');
        );
        break;
      case 1:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => home()),
              (route) => false,
        );
    }
  }

}
