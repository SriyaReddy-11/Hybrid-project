import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotelreservation/cancellation.dart';
import 'package:firebase_database/firebase_database.dart';

import 'aminities/hotel_list.dart';
import 'home.dart';
import 'dart:developer' as developer;

class hotelScreen extends StatefulWidget {
  const hotelScreen({Key? key}) : super(key: key);

  @override
  _hotelScreenState createState() => _hotelScreenState();
}


class _hotelScreenState extends State<hotelScreen> {
  List<HotelList> aminities = [];
  final profBookingID = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    _getPreMadeData();
    super.initState();
  }

  _getPreMadeData() async {
    try {
      aminities = [];
      // get a reference to the desired document / perform a query.
      final profileRef = FirebaseFirestore.instance.collection("Hotel_list");
      // get a SnapShot of the data.
      final snapshot = await profileRef.get();
      List<HotelList> list = [];
      if (snapshot.docs.isNotEmpty) {
        for (var element in snapshot.docs) {
          if (element.exists) {
            final data = element.data();
            var bookingEntity = HotelList(
              docId: element.id,
              name: data['name'],
              status: data['status'],
              image: data['image'],
              price: data['price'],
              a1: data['a1'],
              a2: data['a2'],
              a3: data['a3'],
              a4: data['a4'],
            );
            // Check if hotel is already in booking state
            // if(bookingEntity.bookingId!=null && bookingEntity.bookingId!.contains(profBookingID))
            //   {
            //     bookingEntity.isBooked = true;
            //   } else
            //     {
            //       bookingEntity.isBooked = false;
            //     }
            list.add(bookingEntity);
          }
        }
      }
      setState(() {
        aminities = list;
      });
      print('updated aminities');
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Hotels allHotels = new Hotels();
    // print("hotels ${allHotels.hotels}");
    print('aminities ${aminities}');
    return new Scaffold(
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
                          items: <String>[
                            'Price low to high',
                            'Price high to low',
                            'latest'
                          ].map((String value) {
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
                          items: <String>['Rating', 'Price', 'Avaliability']
                              .map((String value) {
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

                    SingleChildScrollView(
                      child: aminities.isNotEmpty
                          ? ListView.builder(
                              itemCount: aminities.length,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) {
                                final aminity = aminities[index];
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child:
                                              Image.network(aminity.image ?? 'images/hotel1.JPG'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(22.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              aminity.name ?? '',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                            Text(
                                              aminity.price ?? '',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 24),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              aminity.status ?? '',
                                              style: TextStyle(
                                                  color: Colors.green.shade900,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 24),
                                              child: RaisedButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/details', arguments: HotelList(
                                                    docId: aminity.docId,
                                                    name: aminity.name,
                                                    status: aminity.status,
                                                    image: aminity.image,
                                                    price: aminity.price,
                                                    a1: aminity.a1,
                                                    a2: aminity.a2,
                                                    a3: aminity.a3,
                                                    a4: aminity.a4,
                                                  )
                                                  );
                                                },
                                                color: Colors.blueAccent,
                                                child: Text(
                                                  'Details',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]);
                              })
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    )

                  ]),
            ),
          )
          // }
          // },
          //)
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
