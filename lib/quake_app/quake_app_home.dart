import 'package:flutter/material.dart';

class QuakeAppHome extends StatefulWidget {
  QuakeAppHome({Key key}) : super(key: key);

  _QuakeAppHomeState createState() => _QuakeAppHomeState();
}

class _QuakeAppHomeState extends State<QuakeAppHome> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      title: "Quake Application",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Quake Application"),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        
        ),

        body: new Center(
          child: new Text("Hi From Quake Application!"),
        ),

      ),
      
    );
  }
}