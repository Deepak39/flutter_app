import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/json_app_home/json_app_home.dart';
import 'package:flutter_app/quake_app/quake_app_home.dart';

class FlutterAppHome extends StatefulWidget {
  FlutterAppHome({Key key}) : super(key: key);

  _FlutterAppHomeState createState() => _FlutterAppHomeState();
}

class _FlutterAppHomeState extends State<FlutterAppHome> {

  List<AvailableApps> apps = [
    AvailableApps(
      name: "JsonApp", 
      description: "This is an App makes an Api request to Json placeholder site and returns some random data.", 
      objName: JsonAppHome(),
    ),
    AvailableApps(
      name: "Quakes", 
      description: "App makes an Api request and displays some earthquakes informations", 
      objName: QuakeAppHome(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: apps.length,
      itemBuilder: (BuildContext context, int index) {
      return new ListTile(
        onTap: () => Navigator.push(
          context, 
          MaterialPageRoute(builder: (BuildContext context) {
            return apps[index].objName;
          }),
        ),
        onLongPress: () => AlertDialog(
          content: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(""),
              new Text("")
            ],
          ),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.pop(context), 
              child: new Text("OK"),
            ),
          ],
        ),
        leading: new CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: new Text("${apps[index].name[0]}"),
        ),
        title: new Text("${apps[index].name}"),
        subtitle: new Text("${apps[index].description}"),
        isThreeLine: true,
      );
     },
    );
  }
}

class AvailableApps{
  String name, description; // title and subtile of ListTile
  Object objName; // Name of class constructor of App to which it will be Routed
  AvailableApps({
    this.name,
    this.description,
    this.objName,
  });
}