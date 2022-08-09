import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';

abstract class IMapService {
  final FirebaseFirestore db;

  IMapService(this.db);
  Future<Position> determinePosition();
  Future<void> addUser(String mail, String pass,String name,double lat , double long);
  Future<List<UserModel>> retrieveUsers();
  double drawDistance(double lat, long, endLat, endLong);
  Future<List<UserModel>> filterGeo();
}
