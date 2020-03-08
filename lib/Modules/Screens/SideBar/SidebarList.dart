import 'package:flutter/material.dart';

class SidebarList extends StatelessWidget {
  final Function pickedOption;

  SidebarList({this.pickedOption});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          height: 60,
          color: Colors.blue,
        ),
        _createOption('Home', Icons.home, Menu.home),
        _createOption('Notes', Icons.note, Menu.notes),
        _createOption('Setting', Icons.settings, Menu.setting)
      ],
    ));
  }

  _createOption(String title, IconData image, Menu menu) {
    return GestureDetector(
      child: ListTile(
        trailing: Icon(image),
        title: Text(title),
      ),
      onTap: () => this.pickedOption(menu),
    );
  }
}

enum Menu { home, notes, setting }
