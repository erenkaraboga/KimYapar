import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kimyapar/core/constants/path.dart';
import 'package:kimyapar/product/utilities/lottie.dart';
import 'package:kimyapar/product/widgets/map/mapInfoWindow.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../product/widgets/map/bottomshettPanel.dart';
import '../model/UserModel.dart';
import '../viewmodel/controllers/mapController.dart';

class MapSelect extends StatefulWidget {
  const MapSelect({Key? key}) : super(key: key);

  @override
  State<MapSelect> createState() => _MapSelectState();
}

final mapController = Get.find<MapController>();

CustomInfoWindowController _customInfoWindowController =
    CustomInfoWindowController();
final Set<Marker> markers = {};

class _MapSelectState extends State<MapSelect> with TickerProviderStateMixin {
  final double _initFabHeight = 110.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  final double _panelHeightClosed = 85.0;
  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
    mapController.fetchFilteredUser();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .55;
    return Scaffold(
      body: Obx(() => mapController.isLoading.value
          ? Lottie()
          : Stack(children: [
              MapWithPanel(),
              CustomInfo(),
            ])),
    );
  }

  MapWithPanel() {
    return SlidingUpPanel(
      backdropEnabled: true,
      backdropOpacity: 0.6,
      maxHeight: _panelHeightOpen,
      minHeight: _panelHeightClosed,
      parallaxEnabled: true,
      parallaxOffset: .5,
      body: _body(),
      panelBuilder: (sc) => panel(sc, context),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
      onPanelSlide: (double pos) => setState(() {
        _fabHeight =
            pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
      }),
    );
  }

  Center Lottie() => const Center(
        child: SizedBox(
            width: 200,
            height: 200,
            child: LottieProgress(path: AppPaths.lottie_progress)),
      );

  _body() {
    return GoogleMap(
        zoomControlsEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        compassEnabled: false,
        mapToolbarEnabled: false,
        onMapCreated: (GoogleMapController controller) async {
          _customInfoWindowController.googleMapController = controller;
        },
        onCameraMove: (position) {
          _customInfoWindowController.onCameraMove!();
        },
        onTap: (position) {},
        markers: getMarkers(mapController.list.value),
        initialCameraPosition: const CameraPosition(
            target: LatLng(40.536907, 33.588389), zoom: 12.5));
  }

  CustomInfoWindow CustomInfo() {
    return CustomInfoWindow(
      controller: _customInfoWindowController,
      height: 75,
      width: 150,
      offset: 50,
    );
  }

  Set<Marker> getMarkers(List<UserModel> list) {
    for (var element in list) {
      markers.add(Marker(
          markerId: MarkerId(element.id!.toString()),
          position: LatLng(element.lat!, element.long!),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
                MyWidget(name: element.name!, url: element.imageUrl!),
                LatLng(element.lat!, element.long!));
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(170)));
    }
    return markers;
  }
}
