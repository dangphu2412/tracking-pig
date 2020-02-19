import 'package:flutter/material.dart';
import 'package:tracking_pig_behavior/models/pig.dart';

class PigTitle extends StatelessWidget {

    final Pig pig;
    PigTitle({ this.pig });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.fromLTRB(20,6,20,6),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue[300],
          ),
          title: Text(pig.name),
          subtitle: (pig.strength == true)?Text('Pig is strong'): Text('Pig is weak'),
        )
      ),
    );
  }
}