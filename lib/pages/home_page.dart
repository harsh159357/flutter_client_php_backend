/*
 * Copyright 2018 Harsh Sharma
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_client_php_backend/customviews/progress_dialog.dart';
import 'package:flutter_client_php_backend/futures/app_futures.dart';
import 'package:flutter_client_php_backend/models/User.dart';
import 'package:flutter_client_php_backend/models/base/EventObject.dart';
import 'package:flutter_client_php_backend/pages/splash_page.dart';
import 'package:flutter_client_php_backend/utils/app_shared_preferences.dart';
import 'package:flutter_client_php_backend/utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final globalKey = new GlobalKey<ScaffoldState>();

  User user;

  TextEditingController oldPasswordController =
      new TextEditingController(text: "");

  TextEditingController newPasswordController =
      new TextEditingController(text: "");

//------------------------------------------------------------------------------

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (user == null) {
      await initUserProfile();
    }
  }

//------------------------------------------------------------------------------

  Future<void> initUserProfile() async {
    User up = await AppSharedPreferences.getUserProfile();
    setState(() {
      user = up;
    });
  }

//------------------------------------------------------------------------------

  static ProgressDialog progressDialog = ProgressDialog
      .getProgressDialog(ProgressDialogTitles.USER_CHANGE_PASSWORD);

//------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: globalKey,
      body: new Stack(
        children: <Widget>[homeText(), progressDialog],
      ),
    );
  }

//------------------------------------------------------------------------------

  void _logoutFromTheApp() {
    AppSharedPreferences.clear();
    setState(() {
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(builder: (context) => new SplashPage()),
      );
    });
  }

//------------------------------------------------------------------------------

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
                "Welcome : " + ((user == null) ? "User Name" : user.name),
                style: new TextStyle(color: Colors.pink, fontSize: 26.0),
              ),
              margin: EdgeInsets.only(bottom: 10.0),
            ),
            new Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: new Text(
                ((user == null) ? "User Email" : user.email),
                style: new TextStyle(color: Colors.grey, fontSize: 22.0),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: new Text(
                ((user == null) ? "User Unique Id" : user.unique_id),
                style: new TextStyle(color: Colors.grey, fontSize: 22.0),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: new BoxDecoration(color: Colors.blue[400]),
              child: new MaterialButton(
                textColor: Colors.white,
                padding: EdgeInsets.all(15.0),
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: globalKey.currentContext,
                      child: _changePasswordDialog());
                },
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
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: globalKey.currentContext,
                      child: _logOutDialog());
                },
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

//------------------------------------------------------------------------------

  Widget _logOutDialog() {
    return new AlertDialog(
      title: new Text(
        "Logout",
        style: new TextStyle(color: Colors.blue[400], fontSize: 20.0),
      ),
      content: new Text(
        "Are you sure you want to Logout from the App",
        style: new TextStyle(color: Colors.grey, fontSize: 20.0),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text("OK",
              style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
          onPressed: () {
            AppSharedPreferences.clear();
            Navigator.pushReplacement(
              globalKey.currentContext,
              new MaterialPageRoute(builder: (context) => new SplashPage()),
            );
          },
        ),
        new FlatButton(
          child: new Text("Cancel",
              style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
          onPressed: () {
            Navigator.of(globalKey.currentContext).pop();
          },
        ),
      ],
    );
  }

//------------------------------------------------------------------------------

  Widget _changePasswordDialog() {
    return new AlertDialog(
      title: new Text(
        "Change Password",
        style: new TextStyle(color: Colors.blue[400], fontSize: 20.0),
      ),
      content: new Container(
        child: new Form(
            child: new Theme(
                data: new ThemeData(primarySwatch: Colors.pink),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                        child: new TextFormField(
                          controller: oldPasswordController,
                          decoration: InputDecoration(
                              suffixIcon: new Icon(
                                Icons.vpn_key,
                                color: Colors.pink,
                              ),
                              labelText: Texts.OLD_PASSWORD,
                              labelStyle: TextStyle(fontSize: 18.0)),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        margin: EdgeInsets.only(bottom: 10.0)),
                    new Container(
                        child: new TextFormField(
                          controller: newPasswordController,
                          decoration: InputDecoration(
                              suffixIcon: new Icon(
                                Icons.vpn_key,
                                color: Colors.pink,
                              ),
                              labelText: Texts.NEW_PASSWORD,
                              labelStyle: TextStyle(fontSize: 18.0)),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        margin: EdgeInsets.only(bottom: 10.0)),
                  ],
                ))),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text("OK",
              style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
          onPressed: () {
            if (oldPasswordController.text == "") {
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(SnackBarText.ENTER_OLD_PASS),
              ));
              return;
            }

            if (newPasswordController.text == "") {
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(SnackBarText.ENTER_NEW_PASS),
              ));
              return;
            }

            FocusScope
                .of(globalKey.currentContext)
                .requestFocus(new FocusNode());
            Navigator.of(globalKey.currentContext).pop();
            progressDialog.showProgress();
            _changePassword(user.email, oldPasswordController.text,
                newPasswordController.text);
          },
        ),
        new FlatButton(
          child: new Text("Cancel",
              style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
          onPressed: () {
            Navigator.of(globalKey.currentContext).pop();
          },
        ),
      ],
    );
  }

//------------------------------------------------------------------------------

  void _changePassword(
      String emailID, String oldPassword, String newPassword) async {
    EventObject eventObject =
        await changePassword(emailID, oldPassword, newPassword);
    switch (eventObject.id) {
      case EventConstants.CHANGE_PASSWORD_SUCCESSFUL:
        {
          setState(() {
            oldPasswordController.text = "";
            newPasswordController.text = "";
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.CHANGE_PASSWORD_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.CHANGE_PASSWORD_UN_SUCCESSFUL:
        {
          setState(() {
            oldPasswordController.text = "";
            newPasswordController.text = "";
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.CHANGE_PASSWORD_UN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.INVALID_OLD_PASSWORD:
        {
          setState(() {
            oldPasswordController.text = "";
            newPasswordController.text = "";
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.INVALID_OLD_PASSWORD),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.NO_INTERNET_CONNECTION:
        {
          setState(() {
            oldPasswordController.text = "";
            newPasswordController.text = "";
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
    }
  }
}
