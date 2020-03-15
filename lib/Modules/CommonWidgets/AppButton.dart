import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final String route;
  final title;
  final bool isActive;
  AppButton({this.onPressed, this.route, this.title, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: FlatButton(
        onPressed: isActive ? () => this.onPressed(route, context) : null,
        child: Text(title),
      ),
    );
  }
}
