import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tracking_pig_behavior/models/pig.dart';

class DatabaseService {
  final String uid;

  final CollectionReference usersCollection = Firestore.instance.collection('users');

  DatabaseService({ this.uid });

  Future updateUserData(String name, int age, bool strength) async {
    return await usersCollection.document(uid).setData({
      'name': name,
      'age' : age,
      'strength': strength,
    });
  }

  // pig list from snapshots
  List<Pig> _pigListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Pig(
        name: doc.data['name'] ?? '',
        age: doc.data['age'] ?? 0,
        strength: doc.data['strength'] ?? false,
      );
    }).toList();
  }


  Stream<List<Pig>> get users {
    return usersCollection.snapshots()
    .map(_pigListFromSnapshot);
  }

}