import 'package:flutter/material.dart';
import 'package:notes_rea/Modules/CommonWidgets/Loader.dart';
import 'package:notes_rea/Modules/CommonWidgets/StreamListener.dart';
import 'package:notes_rea/Modules/Screens/Notes/Notes/NotesBloc.dart';
import 'package:notes_rea/Modules/Screens/SideBar/SidebarList.dart';
import 'package:notes_rea/Modules/Service/ApiResponse.dart';

class Settings extends StatelessWidget {
  final emialController = TextEditingController();
  final passController = TextEditingController();
  final _bloc = NotesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamListenableBuilder(
          listener: (value) {},
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loader();
            } else if (snapshot.error == ApiStatus.Error) {
              return Center(
                child: Text("Error"),
              );
            } else {
              return _returnForm();
            }
          },
        ));
  }

  _returnForm() {
    return Center(
        child: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
            controller: emialController,
          ),
          TextField(
            controller: passController,
          ),
          FlatButton(
            child: Text("Login"),
            onPressed: this._login,
          )
        ],
      ),
    ));
  }

  _login() {
    _bloc.postNotes(emialController.text, passController.text);
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
