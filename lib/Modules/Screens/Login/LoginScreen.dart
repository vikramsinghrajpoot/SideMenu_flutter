import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_rea/Modules/CommonWidgets/AppButton.dart';
import 'package:notes_rea/Modules/CommonWidgets/AppInput.dart';
import 'package:notes_rea/Modules/CommonWidgets/Dialogs.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Stream<String> stream;
  Status state = Status.initial;

  final emialController = TextEditingController();
  final passController = TextEditingController();

  StreamController<String> streamController = StreamController.broadcast();

  @override
  void initState() {
    _useStream();
    super.initState();
  }

  _useStream() async {
    print('stream creating');
    // stream = Stream<String>.fromFuture(_getNotes());
    print('stream created');

    streamController.stream.listen((data) {
      print('data recied: $data');
    }, onDone: () {
      print('finished');
    }, onError: (err) {
      print('error');
    });

    streamController.stream.listen((data) {
      print('data recied: $data');
    }, onDone: () {
      print('finished');
    }, onError: (err) {
      print('error');
    });

    streamController.add('event');

    streamController.add('event1');
  }

  Future<String> _getNotes() async {
    state = Status.loading;
    print('geting data started');
    await Future.delayed(Duration(seconds: 5));
    print('geting data done');
    state = Status.done;
    return 'this data';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
            child: Column(
          children: <Widget>[
            Text('LoginScreen'),
            Image.asset('images/appicon.png'),
            Image.asset(
              'images/user.png',
              height: 60,
            ),
            AppInput(
              hintText: "name",
              labelText: "Name:",
              controller: emialController,
              onChange: this._onchange,
            ),
            AppInput(
              hintText: "pass",
              labelText: "Password:",
              controller: passController,
              onChange: this._onchange,
              errorText: "Error",
            ),
            new DropdownButton<String>(
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            FlatButton(
              child: Text('Show'),
              onPressed: () {
                Dialogs.confirm(context, 'title', 'description', 'actionText',
                    'cancelText', _dismiss);
              },
            ),
          ],
        )),
      ),
    );
  }

  _dismiss() {
    Navigator.of(context).pop(context);
  }

  _onchange(value, type) {
    switch (type) {
      case InputType.email:

      case InputType.password:
    }
    print(value);
  }

  int _streamCall(int value) {
    print('value: $value');
  }

  _clicked(route, context) {
    print(route);
    Navigator.pushNamed(context, route);
  }
}

enum Type { one, two, three }
enum Status { initial, loading, done }
