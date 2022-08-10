import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';

abstract class IMapService {
  final FirebaseFirestore db;

  IMapService(this.db);
  Future<Position> determinePosition();
  Future<List<UserModel>> retrieveAllUsers();
  double drawDistance(double lat, long, endLat, endLong);
  Future<List<UserModel>> filterGeo();
}
