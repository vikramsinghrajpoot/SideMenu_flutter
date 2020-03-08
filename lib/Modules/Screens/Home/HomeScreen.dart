import 'package:flutter/material.dart';
import 'package:notes_rea/Modules/Screens/Login/LoginScreen.dart';
import 'package:notes_rea/Modules/Screens/Notes/Notes/NotesScreen.dart';
import 'package:notes_rea/Modules/Screens/Settings/Settings.dart';
import 'package:notes_rea/Modules/Screens/SideBar/SidebarList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget container = LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SidebarList(
          pickedOption: this._pickedOption,
        ),
        appBar: AppBar(),
        body: container);
  }

  _moveToNotes(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NotesScreen()));
  }

  _pickedOption(menu) {
    Navigator.pop(context);

    switch (menu) {
      case Menu.home:
        container = LoginScreen();
        break;

      case Menu.notes:
        container = NotesScreen();
        break;

      case Menu.setting:
        container = Settings();
    }
    this.setState(() => {});
    print(menu);
  }
}
