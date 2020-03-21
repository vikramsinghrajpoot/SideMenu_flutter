import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_rea/Modules/CommonWidgets/BaseAlert.dart';

class Dialogs {
  _confirmResult(bool isYes, Function doAction, BuildContext context) {
    Navigator.of(context).pop(context);
    if (isYes) {
      doAction(context);
    } else {}
  }

  static confirm(BuildContext context, String title, String description,
      String actionText, String cancelText, Function doAction) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop(context);
          },
          child: BaseAlert(
            maxHeight: 320,
            minHeight: 320,
            child: Material(
                child: Container(
              color: Colors.red,
              child: Text(title),
            )),
          ),
        );
      },
    );
  }
}
