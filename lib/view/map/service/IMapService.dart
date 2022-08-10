import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';

abstract class IMapService {
  final IFirebaseService service;
  IMapService(this.service);
  Future<Position> determinePosition();
  double drawDistance(double lat, long, endLat, endLong);
  Future<List<UserModel>> filterGeo();
}
