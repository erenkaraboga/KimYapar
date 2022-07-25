import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kimyapar/core/constants/path.dart';
import 'package:kimyapar/product/extension/map_marker.dart';
import 'package:kimyapar/product/init/network/firebase_init.dart';
import 'package:kimyapar/view/map/service/MapService.dart';
import 'package:kimyapar/view/map/viewmodel/map_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';

class MapSelect extends StatefulWidget {
  const MapSelect({Key? key}) : super(key: key);

  @override
  State<MapSelect> createState() => _MapSelectState();
}

late final MapViewModel _mapViewModel;
late final AnimationController _controller;
class _MapSelectState extends State<MapSelect> with TickerProviderStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mapViewModel = MapViewModel(MapService(FirebaseInit.instance.db));
    _mapViewModel.fetcAllMaps();
  }
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _mapViewModel.fetcAllMaps(),
        ),
        body: Observer(
          builder: (_) {
            return _mapViewModel.isLoading ? LottieProgress() : Map();
          },
        ));
  }

  GoogleMap Map() {
    return GoogleMap(
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        compassEnabled: false,
        mapToolbarEnabled: false,
        markers: _mapViewModel.list.toMarkers(),
        initialCameraPosition:
            CameraPosition(target: LatLng(40.599371, 33.610447), zoom: 15.5));
  }

  Center LottieProgress() {
    return Center(
        child: SizedBox(
            height: 200,
            width: 200,
            child: Lottie.network(AppPaths.lottie_progress,
                frameRate: FrameRate.max)));
  }
}
