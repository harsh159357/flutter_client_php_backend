import 'package:flutter/material.dart';
import 'package:flutter_client_php_backend/utils/app_shared_preferences.dart';
import 'package:flutter_client_php_backend/pages/splash_page.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: homeText(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _logoutFromTheApp,
        child: new Icon(Icons.add),
      ),
    );
  }

  void _logoutFromTheApp() {
    AppSharedPreferences.clear();
    setState(() {
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(builder: (context) => new SplashPage()),
      );
    });
  }

  Widget homeText() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Home Page",
              style: new TextStyle(color: Colors.white, fontSize: 40.0),
            )
          ],
        ),
      ),
    );
  }
}
