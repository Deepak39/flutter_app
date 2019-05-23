import "package:flutter/material.dart";

import 'flutter_app_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Application",
      theme: new ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: new FlutterApp(),
    );

  }
}

class FlutterApp extends StatefulWidget {
  FlutterApp({Key key}) : super(key: key);
  _FlutterAppState createState() => _FlutterAppState();
}

class _FlutterAppState extends State<FlutterApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Quake Application"),
      ),
      backgroundColor: Color(0xFFF2F2F2),
      body: new FlutterAppHome(),
    );
  }
}