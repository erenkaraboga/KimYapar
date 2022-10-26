import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';
import 'package:kimyapar/view/map/service/IMapService.dart';

import '../../model/UserModel.dart';

class MapController extends GetxController {
  final IFirebaseService service;
  final IMapService mapService;
  MapController(this.service, this.mapService);
  var isLoading = false.obs;
 var list= Rx<List<UserModel>>([]);
  var position = Position(
          longitude: 0,
          latitude: 0,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0)
      .obs;
  //ok
  getLocation() async {
    final response = await mapService.determinePosition();
    position.value = response;
  }
  double drawDistance(double lat, double long ,double endLat,double endLong){
    return mapService.drawDistance(lat, long, endLat, endLong);
  }
  fetchFilteredUser() async {
    final response = await mapService.filterGeo();
    list.value = response;

  }
  Future<Position> determinePosition()async{
   return await mapService.determinePosition();
  }

  void changeLoading() {
    isLoading.value =true;
  }
}
