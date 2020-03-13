import 'package:flutter/material.dart';
import 'package:notes_rea/Modules/Athuntication/Authentication.dart';
import 'package:notes_rea/Modules/Screens/Login/LoginScreen.dart';
import 'package:notes_rea/Modules/Screens/Notes/Notes/NotesScreen.dart';
import 'package:notes_rea/Modules/Screens/Settings/Settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Authentication(),
      routes: {
        '/': (context) => Authentication(),
        '/notes': (context) => NotesScreen(),
        '/settings': (context) => Settings(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
