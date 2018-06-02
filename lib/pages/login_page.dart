import 'package:flutter/material.dart';
import 'package:flutter_client_php_backend/customviews/progress_dialog.dart';
import 'package:flutter_client_php_backend/futures/app_futures.dart';
import 'package:flutter_client_php_backend/models/base/EventObject.dart';
import 'package:flutter_client_php_backend/utils/constants.dart';
import 'package:flutter_client_php_backend/utils/app_shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final globalKey = new GlobalKey<ScaffoldState>();

  ProgressDialog progressDialog =
      ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);

  TextEditingController emailController =
      new TextEditingController(text: "flutter@flutter.com");

  TextEditingController passwordController =
      new TextEditingController(text: "flutter");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: globalKey,
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[_loginContainer(), progressDialog],
        ));
  }

  Widget _loginContainer() {
    return new Container(
        child: new ListView(
      children: <Widget>[
        new Center(
          child: new Column(
            children: <Widget>[
//------------------------------------------------------------------------------
              _appIcon(),
//------------------------------------------------------------------------------
              _formContainer(),
//------------------------------------------------------------------------------
            ],
          ),
        ),
      ],
    ));
  }

  Widget _appIcon() {
    return new Container(
      decoration: new BoxDecoration(color: Colors.blue[400]),
      child: new Image(
        image: new AssetImage("assets/images/ic_launcher.png"),
        height: 200.0,
        width: 200.0,
      ),
      margin: EdgeInsets.only(top: 20.0),
    );
  }

  Widget _formContainer() {
    return new Container(
      child: new Form(
          child: new Theme(
              data: new ThemeData(primarySwatch: Colors.pink),
              child: new Column(
                children: <Widget>[
//------------------------------------------------------------------------------
                  _emailContainer(),
//------------------------------------------------------------------------------
                  _passwordContainer(),
//------------------------------------------------------------------------------
                  _loginButtonContainer(),
//------------------------------------------------------------------------------
                  _registerNowLabel(),
//------------------------------------------------------------------------------
                ],
              ))),
      margin: EdgeInsets.only(top: 56.0, left: 25.0, right: 25.0),
    );
  }

  Widget _emailContainer() {
    return new Container(
        child: new TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                suffixIcon: new Icon(
                  Icons.email,
                  color: Colors.pink,
                ),
                labelText: Texts.EMAIL,
                labelStyle: TextStyle(fontSize: 18.0)),
            keyboardType: TextInputType.emailAddress),
        margin: EdgeInsets.only(bottom: 20.0));
  }

  Widget _passwordContainer() {
    return new Container(
        child: new TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
              suffixIcon: new Icon(
                Icons.vpn_key,
                color: Colors.pink,
              ),
              labelText: Texts.PASSWORD,
              labelStyle: TextStyle(fontSize: 18.0)),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        margin: EdgeInsets.only(bottom: 35.0));
  }

  Widget _loginButtonContainer() {
    return new Container(
        width: double.infinity,
        decoration: new BoxDecoration(color: Colors.blue[400]),
        child: new MaterialButton(
          textColor: Colors.white,
          padding: EdgeInsets.all(15.0),
          onPressed: _loginButtonAction,
          child: new Text(
            Texts.LOGIN,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        margin: EdgeInsets.only(bottom: 30.0));
  }

  Widget _registerNowLabel() {
    return new Container(
        child: new Text(
          Texts.REGISTER_NOW,
          style: TextStyle(fontSize: 18.0, color: Colors.pink),
        ),
        margin: EdgeInsets.only(bottom: 30.0));
  }

  void _loginButtonAction() {
    if (emailController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_EMAIL),
      ));
      return;
    }

    if (passwordController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_PASS),
      ));
      return;
    }
    FocusScope.of(context).requestFocus(new FocusNode());
    progressDialog.showProgress();
    _loginUser(emailController.text, passwordController.text);
  }

  void _loginUser(String id, String password) async {
    EventObject eventObject = await loginUser(id, password);
    switch (eventObject.id) {
      case EventConstants.LOGIN_USER_SUCCESSFUL:
        {
          setState(() {
            AppSharedPreferences.setUserLoggedIn(true);
            AppSharedPreferences.setUserProfile(eventObject.object);
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.LOGIN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
            _goToHomeScreen();
          });
        }
        break;
      case EventConstants.LOGIN_USER_UN_SUCCESSFUL:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.LOGIN_UN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.NO_INTERNET_CONNECTION:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
    }
  }

  void _goToHomeScreen() {
/*
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => new HomePage()),
    );
*/
  }
}
