import 'package:flutter/material.dart';

class ProgressDialog extends StatefulWidget {
  Color backgroundColor;
  Color color;
  Color containerColor;
  double borderRadius;
  String text;
  ProgressDialogState progressDialogState;

  ProgressDialog(
      {this.backgroundColor = Colors.black54,
      this.color = Colors.white,
      this.containerColor = Colors.transparent,
      this.borderRadius = 10.0,
      this.text});

  @override
  createState() => progressDialogState = new ProgressDialogState(
      backgroundColor: this.backgroundColor,
      color: this.color,
      containerColor: this.containerColor,
      borderRadius: this.borderRadius,
      text: this.text);

  void hideProgress() {
    progressDialogState.hideProgress();
  }

  void showProgress() {
    progressDialogState.showProgress();
  }

  void showProgressWithText(String title) {
    progressDialogState.showProgressWithText(title);
  }

  static Widget getProgressDialog(String title) {
    return new ProgressDialog(
      backgroundColor: Colors.black12,
      color: Colors.white,
      containerColor: Colors.blue,
      borderRadius: 5.0,
      text: title,
    );
  }
}

class ProgressDialogState extends State<ProgressDialog> {
  Color backgroundColor;
  Color color;
  Color containerColor;
  double borderRadius;
  String text;
  bool _opacity = false;

  ProgressDialogState(
      {this.backgroundColor = Colors.black54,
      this.color = Colors.white,
      this.containerColor = Colors.transparent,
      this.borderRadius = 10.0,
      this.text});

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: !_opacity
            ? null
            : new Opacity(
                opacity: _opacity ? 1.0 : 0.0,
                child: new Stack(
                  children: <Widget>[
                    new Center(
                      child: new Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                            color: containerColor,
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(borderRadius))),
                      ),
                    ),
                    new Center(
                      child: _getCenterContent(),
                    )
                  ],
                ),
              ));
  }

  Widget _getCenterContent() {
    if (text == null || text.isEmpty) {
      return _getCircularProgress();
    }

    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getCircularProgress(),
          new Container(
            margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: new Text(
              text,
              style: new TextStyle(color: color),
            ),
          )
        ],
      ),
    );
  }

  Widget _getCircularProgress() {
    return new CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation(color));
  }

  void hideProgress() {
    setState(() {
      _opacity = false;
    });
  }

  void showProgress() {
    setState(() {
      _opacity = true;
    });
  }

  void showProgressWithText(String title) {
    setState(() {
      _opacity = true;
      text = title;
    });
  }
}
