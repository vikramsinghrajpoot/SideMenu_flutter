import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_rea/Modules/CommonWidgets/Loader.dart';
import 'package:notes_rea/Modules/Screens/Home/HomeScreen.dart';
import 'package:notes_rea/Modules/Screens/Login/LoginScreen.dart';

class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _checkForAuthentication(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == true) {
                  return HomeScreen();
                } else {
                  return LoginScreen();
                }
              } else {
                return Loader(
                  bckColor: Colors.red,
                );
              }
            }));
  }

  Future<bool> _checkForAuthentication() async {
    return true;
  }
}
