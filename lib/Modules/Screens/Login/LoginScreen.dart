import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_rea/Modules/CommonWidgets/AppButton.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Stream<String> stream;
  Status state = Status.initial;

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
            AppButton(
              onPressed: (route, count) => this._clicked(route, context),
              route: '/notes',
              title: 'One',
              isActive: false,
            ),
            AppButton(
              onPressed: (route, cont) => this._clicked(route, context),
              title: 'two',
              route: '/settings',
            ),
            AppButton(
              onPressed: (route, cont) => this._clicked(route, context),
              route: '/login',
              title: 'three',
            ),
            Row(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  height: 40,
                  width: 40,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  color: Colors.green,
                  height: 40,
                  width: 40,
                ),
                Container(
                  color: Colors.blue,
                  height: 40,
                  width: 40,
                ),
                Text('$state')
              ],
            )
          ],
        )),
      ),
    );
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
