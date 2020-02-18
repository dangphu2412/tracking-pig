import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_pig_behavior/screens/authenticate/authenticate.dart';
import 'package:tracking_pig_behavior/screens/home/home.dart';
import 'package:tracking_pig_behavior/screens/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    }
    else { 
      return Home(); 
    }
  }
}