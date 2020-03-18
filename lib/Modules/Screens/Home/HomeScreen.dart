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
  int _currentIndex = 0;
  final List<Widget> _children = [
    Container(
      child: Column(
        children: <Widget>[
          GestureDetector(child: Text('This is Home'),),
        ],
      ),
    ),
    NotesScreen(
      neeAppBar: true,
    ),
    Settings(),
    LoginScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarList(
        pickedOption: this._pickedOption,
      ),
      appBar: AppBar(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _tabSelected,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              color: Colors.red,
            ),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.mail,
              color: Colors.red,
            ),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.mail,
              color: Colors.red,
            ),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.red,
              ),
              title: Text('Profile'))
        ],
      ),
    );
  }

  _tabSelected(tab) {
    _showAlert();
    this.setState(() {
      _currentIndex = tab;
    });
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

  _showAlert() {
    return AlertDialog(
      title: Text('Ttitle'),
      content: Text('here we go!'),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
