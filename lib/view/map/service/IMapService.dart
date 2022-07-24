import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';

abstract class IMapService {
  final FirebaseFirestore _db;

  IMapService(this._db);

  Future<List<UserModel>> retrieveUsers();
  double drawDistance(double lat, long, endLat, endLong);
  Future<List<UserModel>> filterGeo();
}