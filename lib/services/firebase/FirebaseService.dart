import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:get/get.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';

import '../../view/map/model/UserModel.dart';
import '../../view/map/view/mapPage.dart';
import '../../view/map/viewmodel/controllers/mapController.dart';

class FirebaseService extends IFirebaseService {
  FirebaseService(super.auth, super.db);
final geo = Geoflutterfire();

double radius = 40;
String field = 'position';
  @override
    Stream<List<DocumentSnapshot>> getAllUsers()  {
    GeoFirePoint myLocation = geo.point(latitude: mapController.position.value.latitude, longitude:mapController.position.value.longitude);
    return geo
        .collection(collectionRef: super.db.collection("users"))
        .within(center: myLocation, radius: radius, field: field);
  }

  @override
  Future<List<UserModel>> getOtherUsers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await super
        .db
        .collection("users")
        .where('id', isNotEqualTo: super.auth.currentUser!.uid)
        .get();
    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  @override
  Future<UserModel> getCurrentUser(String id) async {
    var response = await super.db.collection('users').doc(id).get();
    var user = UserModel.fromDocumentSnapshot(response);
    return user;
  }
}
