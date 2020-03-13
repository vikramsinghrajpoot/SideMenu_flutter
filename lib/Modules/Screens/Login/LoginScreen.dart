import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
            FlatButton(
              onPressed: () => this._clicked(Type.one, context),
              child: Text('oneTitle'),
            ),
            FlatButton(
              onPressed: () => this._clicked(Type.two, context),
              child: Text('twoTitle'),
            ),
            FlatButton(
              onPressed: () => this._clicked(Type.three, context),
              child: Text('threeTitle'),
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
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  _clicked(Type type, context) {
    print(type);
    Navigator.pushNamed(context, '/notes');
  }
}

enum Type { one, two, three }
