import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kimyapar/view/map/service/IMapService.dart';

import '../../model/UserModel.dart';

class MapController extends GetxController {
  final IMapService mapService;
  MapController(this.mapService);
  var isLoading = false.obs;

  List<UserModel> list = <UserModel>[].obs;
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
  Future<void> getLocation() async {
    final response = await mapService.determinePosition();
    position.value = response;
    inspect(position);
  }
  Future<void> fetcAllMaps() async {
    changeLoading();
    final response = await mapService.filterGeo();
    await Future.delayed(Duration(seconds: 2));
    changeLoading();

    list = response;
    inspect(list);
  }

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }
}
