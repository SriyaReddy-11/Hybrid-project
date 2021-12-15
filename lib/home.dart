import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                      image: AssetImage('images/wallpaper.jpg'),
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.dstATop),
                      fit: BoxFit.cover),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 115.0),
                        child: Image.asset('images/bg.jpg',
                          width: 250,
                        ),
                      ),
                      Image.asset('images/togo.png',
                        width: 150,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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
                                    BorderRadius.circular(8),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 220.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                            primary: Colors.redAccent,
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.pushNamed(context, '/login');
                            }
                            );
                          },
                          child: Text('Get Started...',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic
                            ),),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, '/account');
                          });
                        },
                        child: Text('Don\'t have an account?? Create now..',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey.shade300
                          ),),
                      ),
                    ],
                  ),
                ))));
  }
}
