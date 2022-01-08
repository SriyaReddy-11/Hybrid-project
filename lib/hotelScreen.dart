import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class hotelScreen extends StatefulWidget {
  const hotelScreen({Key? key}) : super(key: key);

  @override
  _hotelScreenState createState() => _hotelScreenState();
}

class _hotelScreenState extends State<hotelScreen> {
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
      ),
    );
  }
}
