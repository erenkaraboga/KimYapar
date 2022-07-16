import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kimyapar/models/UserModel.dart';

class UserHelper {
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  static List<UserModel> list = [];

  Future<UserHelper> init() async {
    await retrieveUsers().then((value) {
      list = value;
    });
    printDistances(filterGeo());
    return this;
  }

  static Future<List<UserModel>> retrieveUsers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("users").get();
    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

 static double drawDistance(double lat, long, endLat, endLong) {
    return Geolocator.distanceBetween(lat, long, endLat, endLong);
  }

  static List<UserModel> filterGeo() {
    List<UserModel> nearList = [];
    nearList.addAll(list);
    nearList.retainWhere((element) =>
        drawDistance(element.lat, element.long, 40.599391, 33.610534) < 1200);
    print("Yakındaki Aşçılar = " + "${nearList.length}");
    return nearList;
  }

 static void printDistances(List<UserModel> list) {
    list.forEach((element) {
      print("${element.name} " +
          "${drawDistance(element.lat, element.long, 40.599391, 33.610534)} M");
    });
  }
}
