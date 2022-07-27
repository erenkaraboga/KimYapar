import 'dart:developer';
import 'dart:ffi';

import 'package:geolocator/geolocator.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';
import 'package:kimyapar/view/map/service/IMapService.dart';
import 'package:mobx/mobx.dart';
part 'map_view_model.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase with Store {
  final IMapService mapService;
  _MapViewModelBase(this.mapService);
  @observable
  Position position = Position(
      longitude: 0,
      latitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0);
  @action
  Future<void> getLocation() async {
    final response = await mapService.determinePosition();
    position = response;
    inspect(position);
  }

  @observable
  List<UserModel> list = [];
  @action
  Future<void> fetcAllMaps() async {
    changeLoading();
    final response = await mapService.filterGeo();
    await Future.delayed(Duration(seconds: 2));
    changeLoading();

    list = response;
    inspect(list);
  }

  @observable
  bool isLoading = false;
  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
