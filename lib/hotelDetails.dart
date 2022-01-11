import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotelreservation/aminities/hotel_list.dart';

import 'cancellation.dart';
import 'home.dart';

class hotelDetails extends StatefulWidget {
  final String a1, a2, a3, a4, name, price, image, docId;
  const hotelDetails(
      {Key? key,
      required this.a1,
      required this.a2,
      required this.a3,
      required this.a4,
      required this.name,
      required this.price,
      required this.docId,
      required this.image})
      : super(key: key);

  static const routeName = '/details';

  @override
  _hotelDetailsState createState() => _hotelDetailsState();
}

class _hotelDetailsState extends State<hotelDetails> {
  String buttonText = "Book";
  bool isChanged = true;

  bool isBooked = false;

  @override
  void initState() {
    _checkIfBooked();
    super.initState();
  }

  _checkIfBooked() async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    final userRef = FirebaseFirestore.instance.collection('users').doc(userID);
    final snapshot = await userRef.get();

    if (snapshot.exists && snapshot.data()!.containsKey('bookings')) {
      final List<dynamic> prevBookings = snapshot['bookings'] ?? [];
      if (prevBookings.contains(widget.docId)) {
        setState(() {
          isBooked = true;
        });
      } else {
        setState(() {
          isBooked = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: MyBullet(),
                  title: Text(
                    widget.a1,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: MyBullet(),
                  title: Text(
                    widget.a2,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: MyBullet(),
                  title: Text(
                    widget.a3,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: MyBullet(),
                  title: Text(
                    widget.a4,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                          color: Colors.blue.shade300,
                          child: Text(
                            this.isBooked ? "Booked" : "Book Now",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: this.isBooked
                              ? null
                              : () {
                                  bookingSubmission(widget.docId);
                                }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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

  bookingSubmission(String docID) async {
    try {
      final userID = FirebaseAuth.instance.currentUser?.uid;
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(userID);
      final snapshot = await userRef.get();
      final List<String> bookings = [docID];

      if (snapshot.exists && snapshot.data()!.containsKey('bookings')) {
        final prevBookings = snapshot['bookings'] ?? [];
        prevBookings.forEach((bId) {
          if (!bookings.contains(bId)) {
            bookings.add(bId);
          }
        });
      }

      await userRef.set({'bookings': bookings}, SetOptions(merge: true));
      _checkIfBooked();
      Navigator.pushNamed(
          context, '/confirm');
    } on FirebaseAuthException catch (e) {
      print(e);
    }
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
