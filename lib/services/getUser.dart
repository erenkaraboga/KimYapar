import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kimyapar/models/UserModel.dart';

class getData {
  GeoPoint geoPoint = GeoPoint(0, 0);
 final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<UserModel>> retrieveUsers() async {
   QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("users").get();
        return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
    
  }
  void printData(){
    retrieveUsers().then((value) => print(value));
  }
}
