import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kimyapar/core/constants/path.dart';
import 'package:kimyapar/product/utilities/lottie.dart';
import 'package:kimyapar/product/widgets/map/customFloatButton.dart';
import 'package:kimyapar/product/widgets/map/mapInfoWindow.dart';

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
  @override
  void initState() {
    super.initState();

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
    return Scaffold(
        floatingActionButton: const CustomFloatButton(),
        body: Obx(() => mapController.isLoading.value
            ? Lottie()
            : Stack(
                children: [Map(), CustomInfo()],
              )));
  }

  Center Lottie() => const Center(
        child: SizedBox(
            width: 200,
            height: 200,
            child: LottieProgress(path: AppPaths.lottie_progress)),
      );

  Map() {
    return GoogleMap(
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        compassEnabled: false,
        mapToolbarEnabled: false,
        onMapCreated: (GoogleMapController controller) async {
          _customInfoWindowController.googleMapController = controller;
        },
        onCameraMove: (position) {
          _customInfoWindowController.onCameraMove!();
        },
        onTap: (position) {},
        markers: getMarkers(mapController.list),
        initialCameraPosition: const CameraPosition(
            target: LatLng(40.536907, 33.588389), zoom: 13.5));
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
