import 'package:flutter/material.dart';
import 'package:notes_rea/Modules/CommonWidgets/AppButton.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration interval = Duration(seconds: 2);
  Stream<int> stream;
  @override
  void initState() {
    _useStream();
    super.initState();
    
  
  }

  _useStream() async{
    stream = Stream<int>.periodic(interval, _streamCall);
    await for(int i in stream){
      print(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
