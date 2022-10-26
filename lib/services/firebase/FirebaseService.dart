import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';

import '../../view/map/model/UserModel.dart';

class FirebaseService extends IFirebaseService {
  FirebaseService(super.auth, super.db);

  @override
   Stream<QuerySnapshot<Map<String, dynamic>>>  getAllUsers()  {
    var snapshot =
         super.db.collection("users").snapshots();
        return snapshot;
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
