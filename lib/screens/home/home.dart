import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tracking_pig_behavior/services/auth.dart';
import 'package:tracking_pig_behavior/services/database.dart';
import 'package:tracking_pig_behavior/screens/home/pig_list.dart';
import 'package:tracking_pig_behavior/models/pig.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Pig>>.value(
        value: DatabaseService().users,
        child: Scaffold(
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
        body: PigList(),
      ),
    );
  }
}