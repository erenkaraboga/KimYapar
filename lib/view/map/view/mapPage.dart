import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kimyapar/product/extension/map_marker.dart';
import 'package:kimyapar/product/init/network/firebase_init.dart';
import 'package:kimyapar/view/map/service/MapService.dart';
import 'package:kimyapar/view/map/viewmodel/map_view_model.dart';
import 'package:mobx/mobx.dart';

class MapSelect extends StatefulWidget {
  const MapSelect({Key? key}) : super(key: key);

  @override
  State<MapSelect> createState() => _MapSelectState();
}

late final MapViewModel _mapViewModel;

class _MapSelectState extends State<MapSelect> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mapViewModel = MapViewModel(MapService(FirebaseInit.instance.db));
    _mapViewModel.fetcAllMaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(
      builder: (_) {
        return _mapViewModel.isLoading
            ? CircularProgressIndicator()
            : GoogleMap(
                markers: _mapViewModel.list.toMarkers(),
                initialCameraPosition: CameraPosition(
                    target: LatLng(40.599371, 33.610447), zoom: 15.5));
      },
    ));
  }
}
