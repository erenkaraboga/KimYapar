import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kimyapar/models/UserModel.dart';

class getData {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<UserModel> list = [];

  Future<List<UserModel>> retrieveUsers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("users").get();

    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  void filterGeo() {
    print(Geolocator.distanceBetween(40.536907, 33.588389, 38.423733, 27.142826).);
    retrieveUsers().then((value) => print(value.where((element) =>
        Geolocator.distanceBetween(
            element.lat, element.long, 38.423733, 27.142826)<5646546546532156)));
  }
}
