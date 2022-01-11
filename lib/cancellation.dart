import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotelreservation/aminities/hotel_list.dart';

class cancellation extends StatefulWidget {
  @override
  _cancellationState createState() => _cancellationState();
}

class _cancellationState extends State<cancellation> {
  List<HotelList> aminities = [];
  createAlertDialog(BuildContext context, String? docId) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Cancellation confirmed'),
            content: Text(
                'Your booking has been cancelled. Looking forward to having you back'),
            actions: [
              RaisedButton(
                onPressed: () {
                  bookingSubmission(docId!);
                },
                color: Colors.blue.shade300,
                child: Text("Continue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    _getBookedHotels();
    super.initState();
  }

  _getBookedHotels() async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    final userRef = FirebaseFirestore.instance.collection('users').doc(userID);
    final hotelRef = FirebaseFirestore.instance.collection("Hotel_list");
    final snapshot = await userRef.get();
    setState(() {
      aminities = [];
    });
    if (snapshot.exists && snapshot.data()!.containsKey('bookings')) {
      final List<dynamic> prevBookings = snapshot['bookings'] ?? [];
      List<HotelList> list = [];
      prevBookings.forEach((bookId) async {
        final hotelSnapshot = await hotelRef.doc(bookId).get();
        if (hotelSnapshot.exists) {
          final data = hotelSnapshot.data();
          var bookingEntity = HotelList(
            docId: bookId,
            name: data!['name'],
            status: data['status'],
            image: data['image'],
            price: data['price'],
            a1: data['a1'],
            a2: data['a2'],
            a3: data['a3'],
            a4: data['a4'],
          );
          aminities.add(bookingEntity);
          setState(() {
            aminities = aminities;
          });
        }
      });
    }
  }

  bookingSubmission(String docID) async {
    try {
      final userID = FirebaseAuth.instance.currentUser?.uid;
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(userID);
      final snapshot = await userRef.get();
      final List<String> bookings = [];

      if (snapshot.exists && snapshot.data()!.containsKey('bookings')) {
        final prevBookings = snapshot['bookings'] ?? [];
        prevBookings.forEach((bId) {
          if (docID != bId) {
            bookings.add(bId);
          }
        });
      }

      await userRef.set({'bookings': bookings}, SetOptions(merge: true));
      _getBookedHotels();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: RaisedButton(
          color: Colors.redAccent,
          child: Icon(
            Icons.arrow_back,
            color: Color(0xffCCCCCC),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/screen');
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                aminities.isNotEmpty
                    ? ListView.builder(
                        itemCount: aminities.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          final aminity = aminities[index];
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Image.network(
                                        aminity.image ?? 'images/hotel1.JPG'),
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
                                  padding: const EdgeInsets.only(left: 24),
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
                                        padding:
                                            const EdgeInsets.only(right: 24),
                                        child: RaisedButton(
                                          onPressed: () {
                                            createAlertDialog(
                                                context, aminity.docId);
                                          },
                                          color: Colors.redAccent.shade100,
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(10.0),
                                //   child: Text(
                                //     'You are proceeding to cancel your reservation. \nPlease Click on the button to confirm',
                                //     style: TextStyle(
                                //       fontStyle: FontStyle.italic,
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 22,
                                //     ),
                                //   ),
                                // ),
                              ]);
                        })
                    : const Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'No bookings found for you!',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
