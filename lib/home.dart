import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final List<String> slideimage = [
    'images/news1.JPG',
    'images/news2.JPG',
    'images/news3.JPG',
    'images/news4.JPG'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bg.jpg'),
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.dstATop),
                      fit: BoxFit.cover),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Text('RentoGo',
                          style: TextStyle(
                              fontSize: 70,
                              color: Colors.deepOrange.shade500,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Icon(
                            Icons.home,
                            color: Colors.deepOrangeAccent,
                            size: 300,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            color: Colors.red.shade100,
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, '/login');
                              }
                              );
                            },
                            child: Text('Log In'),
                          ),
                          RaisedButton(
                            color: Colors.red.shade100,
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text('Create Account'),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              CarouselSlider(
                                  options: CarouselOptions(
                                      height: 100,
                                      autoPlay: true,
                                      //enableInfiniteScroll: true,
                                      enlargeCenterPage: true),
                                  items: slideimage
                                      .map((e) => ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(6),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Image.asset(
                                          e,
                                          width: double.maxFinite,
                                          height: double.maxFinite,
                                          //fit: BoxFit.fill,
                                          fit: BoxFit.contain,
                                        )
                                      ],
                                    ),
                                  ))
                                      .toList()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
