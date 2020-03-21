import 'package:flutter/material.dart';
import 'package:notes_rea/Modules/Screens/SideBar/SidebarList.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map obj = ModalRoute.of(context).settings.arguments;
    final Menu type = obj['type'] as Menu;
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: _pickChild(type)),
    );
  }

  _pickChild(type) {
    if (type == Menu.setting) {
      return Column(
        children: <Widget>[
          type == Menu.setting ? Text('Settings') : Container(),
          Text('Note'),
          Text('Login'),
        ],
      );
    }
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    return super.debugDescribeChildren();
  }
}
