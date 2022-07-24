import 'dart:developer';

import 'package:kimyapar/view/map/model/UserModel.dart';
import 'package:kimyapar/view/map/service/IMapService.dart';
import 'package:mobx/mobx.dart';
part 'map_view_model.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase with Store {
  final IMapService mapService;
   @observable
  List<UserModel> list = [];
  _MapViewModelBase(this.mapService);
  @observable
  bool isLoading = false;
  @action
  Future<void> fetcAllMaps() async {
    changeLoading();
    final response = await mapService.filterGeo();
    changeLoading();
    list = response;
    inspect(list);
  }
 @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
