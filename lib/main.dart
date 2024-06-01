import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_covid_tracker/views/home.dart';
import 'package:universal_covid_tracker/views/splash_screen.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uniersal Covid Tracker',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey
      ),
      home: HomeScreen(),
    );
  }

}