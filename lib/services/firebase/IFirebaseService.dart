import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../view/map/model/UserModel.dart';

abstract class IFirebaseService {
  final FirebaseAuth auth;
  //final FirebaseMessaging fcm;
  final FirebaseFirestore db;
  IFirebaseService(this.auth, this.db);
  Future<List<UserModel>> getAllUsers();
  Future<UserModel> getCurrentUser(String id);
}
