import 'package:flutter/material.dart';

void main() => runApp(new FlutterClientPHPBackendApp());

class FlutterClientPHPBackendApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Client PHP Backend',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: new Center(
          child: new Text(
            "Hello Flutter",
            style: new TextStyle(fontSize: 40.0),
          ),
        ),
      ),
    );
  }
}
