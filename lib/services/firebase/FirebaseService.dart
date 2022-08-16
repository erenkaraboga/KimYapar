import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';

import '../../view/map/model/UserModel.dart';

class FirebaseService extends IFirebaseService {
  FirebaseService(super.auth, super.db);

  @override
  Future<List<UserModel>> getAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await super.db.collection("users").get();
        return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
   @override
  Future<List<UserModel>> getOtherUsers() async{
     QuerySnapshot<Map<String, dynamic>> snapshot =
        await super.db.collection("users").where('id',isNotEqualTo: super.auth.currentUser!.uid).get();
    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
  @override
  Future<UserModel> getCurrentUser(String id) async {
    var user = UserModel();
    var list = await getAllUsers();
    for (var element in list) {
      if (element.id == id) {
        user = element;
      }
    }
    return user;
  }
}
