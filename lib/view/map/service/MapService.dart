import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';
import 'package:kimyapar/view/map/service/IMapService.dart';

class MapService extends IMapService {
  MapService(super._db);
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override
  Future<List<UserModel>> retrieveUsers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("users").get();

    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  @override
  double drawDistance(double lat, long, endLat, endLong) {
    return Geolocator.distanceBetween(lat, long, endLat, endLong);
  }

  @override
  Future<List<UserModel>> filterGeo() async {
    List<UserModel> nearList = [];
    await retrieveUsers().then((list) {
      nearList.addAll(list);
      nearList.retainWhere((element) =>
          drawDistance(element.lat!, element.long, 40.599391, 33.610534) <
          1200);
      print("Yakındaki Aşçılar = " "${nearList.length}");
    });
    return nearList;
  }

  @override
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<void> addUser(
      String mail, String pass, String name, double lat, double long) async {
    final response = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: mail, password: pass);

    if (response.user != null) {
      String id = response.user!.uid;
      FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .set({'id': id, 'name': name, 'lat': lat, 'long': long});
    }
    inspect(response.credential!.token.toString());
  }
}
