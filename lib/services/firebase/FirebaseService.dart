import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';

import '../../view/map/model/UserModel.dart';

class FirebaseService extends IFirebaseService{
  FirebaseService(super.auth, super.db);
  @override
  Future<List<UserModel>> getAllUsers()async {
     QuerySnapshot<Map<String, dynamic>> snapshot =
        await super.db.collection("users").get();
    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
  @override
  void getCurrentUser(String id) {
    super.db
    .collection('users')
    .doc(id)
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}