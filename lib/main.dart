import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_pig_behavior/models/user.dart';
import 'package:tracking_pig_behavior/screens/wrapper.dart';
import 'package:tracking_pig_behavior/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Tracking App',
        home: Wrapper(),
      ),
    );
  }
}