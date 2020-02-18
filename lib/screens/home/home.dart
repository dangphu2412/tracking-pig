import 'package:flutter/material.dart';
import 'package:tracking_pig_behavior/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tracking'),
        backgroundColor: Colors.blue,
        elevation: 2,
        actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('log out'),
              onPressed: () async {
                await _auth.signOut();
              }, 
          )
        ],
      ),
    );
  }
}