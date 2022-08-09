import 'dart:developer';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kimyapar/view/map/service/IMapService.dart';

import '../../../../product/widgets/map/mapInfoWindow.dart';
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
  getLocation() async {
    final response = await mapService.determinePosition();
    position.value = response;
    inspect(position);
  }

  fetcAllMaps() async {
    changeLoading();
    final response = await mapService.filterGeo();
    await Future.delayed(const Duration(seconds: 2));
    changeLoading();
    list = response;
    inspect(list);
  }

  

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }
}
