import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/utils/constants.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _moveToNextScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  _loadAndMove() {
    Timer(Duration(seconds: 7), () {
      _moveToNextScreen();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadAndMove();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: media.width,
              height: media.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.tealAccent, Colors.brown],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(Constants.SPLASH_IMG_URL),
                  Text(
                    'Music App 2020',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  Text('All CopyRight Reserved'),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: RaisedButton(
                        elevation: 10,
                        padding: EdgeInsets.all(20),
                        color: Colors.teal,
                        onPressed: () {
                          _moveToNextScreen();
                        },
                        child: Text('Go Further'),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
      //backgroundColor: Colors.lightGreenAccent,
    );
  }
}
