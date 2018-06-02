import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_client_php_backend/models/User.dart';
import 'package:flutter_client_php_backend/pages/splash_page.dart';
import 'package:flutter_client_php_backend/utils/app_shared_preferences.dart';
import 'package:flutter_client_php_backend/utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  User user;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (user == null) {
      await initUserProfile();
    }
  }

  Future<void> initUserProfile() async {
    User up = await AppSharedPreferences.getUserProfile();
    setState(() {
      user = up;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Home Page"),
      ),
      body: homeText(),
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
        height: double.infinity,
        width: double.infinity,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Container(
              child: new Text(
                "Welcome : " + user.name,
                style: new TextStyle(color: Colors.pink, fontSize: 26.0),
              ),
              margin: EdgeInsets.only(bottom: 10.0),
            ),
            new Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: new Text(
                user.email,
                style: new TextStyle(color: Colors.grey, fontSize: 22.0),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: new Text(
                user.unique_id,
                style: new TextStyle(color: Colors.grey, fontSize: 22.0),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: new BoxDecoration(color: Colors.blue[400]),
              child: new MaterialButton(
                textColor: Colors.white,
                padding: EdgeInsets.all(15.0),
                onPressed: null,
                child: new Text(
                  Texts.CHANGE_PASSWORD,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            new Container(
              decoration: new BoxDecoration(color: Colors.blue[400]),
              child: new MaterialButton(
                textColor: Colors.white,
                padding: EdgeInsets.all(15.0),
                onPressed: _logoutFromTheApp,
                child: new Text(
                  Texts.LOGOUT,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ));
  }
}
