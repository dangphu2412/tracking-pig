import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_pig_behavior/models/pig.dart';
import 'package:tracking_pig_behavior/screens/home/pig_title.dart';

class PigList extends StatefulWidget {
  @override
  _PigListState createState() => _PigListState();
}

class _PigListState extends State<PigList> {
  @override
  Widget build(BuildContext context) {

    final pigs = Provider.of<List<Pig>>(context);
    return ListView.builder(
      itemCount: pigs.length,
      itemBuilder: (context, index) {
        return PigTitle(pig: pigs[index]);
      }
    );
  }
}