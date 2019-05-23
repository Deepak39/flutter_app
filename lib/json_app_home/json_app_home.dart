import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JsonAppHome extends StatefulWidget {
  JsonAppHome({Key key}) : super(key: key);

  @override
  _JsonAppHomeState createState() => _JsonAppHomeState(); 
}

class _JsonAppHomeState extends State<JsonAppHome>{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'json app',
      home: new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
            onPressed: () => Navigator.pop(context),
            icon: new Icon(Icons.arrow_back_ios),
          ),
          title: Text("JsonApp"),
        ),
        body: FutureBuilder(
          future: _getJsonData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            //Action done when future builder called on null
            if(snapshot.data == null){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                      new CircularProgressIndicator(strokeWidth: 3.0),
                      SizedBox(height: 5.0),
                      new Text("Turn on internet..."),
                      new Text("(in case if it is off)",
                        style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                ),
              );
            }

            else{
              return null;
            }


          },
        ),
      )
    );
  }

  Future<List> _getJsonData() async {

    String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(apiUrl);
    var jsonData = json.decode(response.body);

    List<Posts> posts = [];

    for(var post in jsonData){
      Posts p = Posts(userId: post['userId'], id: post['id'], title: post['title'], body: post['body'],);
      posts.add(p);
    }

    print(posts);
    return posts;

  }

}

class Posts{
  int userId, id;
  String title, body;

  Posts({
    @required this.id,
    @required this.userId,
    @required this.title,
    @required this.body
  });

}

//String apiUrl = 'https://jsonplaceholder.typicode.com/posts';