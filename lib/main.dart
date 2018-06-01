import 'package:flutter/material.dart';
import 'package:flutter_client_php_backend/pages/splash_page.dart';

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
      home: new SplashPage(),
    );
  }
}
