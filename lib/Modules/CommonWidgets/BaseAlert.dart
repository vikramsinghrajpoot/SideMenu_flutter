import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseAlert extends StatelessWidget {
  final Widget child;
  final double minHeight;
  final double maxHeight;
  BaseAlert({@required this.child, this.maxHeight = 510, this.minHeight = 500});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 18.7, right: 18.7, top: 18.7, bottom: 18.7),
      decoration: new BoxDecoration(
        color: Colors.black.withOpacity(0.6000000238418579),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: this.minHeight, maxHeight: this.maxHeight),
          child: Container(
            child: Center(child: this.child),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
