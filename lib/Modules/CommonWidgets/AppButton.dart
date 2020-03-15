import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final String route;
  final title;
  AppButton({this.onPressed, this.route, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: FlatButton(
        onPressed: () => this.onPressed(route, context),
        child: Text(title),
      ),
    );
  }
}
