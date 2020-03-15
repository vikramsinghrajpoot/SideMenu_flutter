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
        body: Container(
          child: Column(
            children: <Widget>[
              Text('This is default'),
            ],
          ),
        ));
  }

  _moveToNotes(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NotesScreen()));
  }

  _pickedOption(menu) {
    Navigator.pop(context);

    switch (menu) {
      case Menu.home:
        Navigator.pushNamed(context, '/login');
        break;

      case Menu.notes:
        // container = NotesScreen();
        //Navigator.pushNamed(context, '/notes');
        Navigator.pushNamed(context, '/settings',
            arguments: {'type': Menu.notes});

        break;

      case Menu.setting:
        // container = Settings();
        Navigator.pushNamed(context, '/settings',
            arguments: {'type': Menu.setting});
    }
    this.setState(() => {});
    print(menu);
  }
}
