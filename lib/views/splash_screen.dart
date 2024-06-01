import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   Timer(Duration(seconds: 1),(){
     Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "asset/images/virus.png",
              fit: BoxFit.cover,
              height: 130,
              width: 130,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "UNIVERSAL COVID TRACKER",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22.0,
                  color: Colors.blueGrey),
            )
          ],
        ),
      ),
    );
  }
}
