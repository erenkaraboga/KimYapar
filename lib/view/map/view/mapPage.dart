import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kimyapar/core/constants/colors.dart';
import 'package:kimyapar/core/constants/path.dart';
import 'package:kimyapar/product/init/network/firebase_init.dart';
import 'package:kimyapar/product/utilities/lottie.dart';
import 'package:kimyapar/product/widgets/map/mapInfoWindow.dart';
import 'package:kimyapar/view/map/service/MapService.dart';
import 'package:kimyapar/view/map/viewmodel/map_view_model.dart';

import '../model/UserModel.dart';

class MapSelect extends StatefulWidget {
  const MapSelect({Key? key}) : super(key: key);

  @override
  State<MapSelect> createState() => _MapSelectState();
}

late final MapViewModel _mapViewModel;
late final AnimationController _controller;
late final CustomInfoWindowController _customInfoWindowController;
final Set<Marker> markers = {};

class _MapSelectState extends State<MapSelect> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    MapService((FirebaseInit.instance.db))
        .addUser("huseifasynaaasdfafsalav@gmail.com", "123455645", "Erenn", 40, 50);
    _mapViewModel = MapViewModel(MapService(FirebaseInit.instance.db));
    _customInfoWindowController = CustomInfoWindowController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mapViewModel.getLocation();
    _mapViewModel.fetcAllMaps();
  }

  @override
  void dispose() {
    _controller.dispose();
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatButton(),
        body: Observer(
          builder: (_) {
            return _mapViewModel.isLoading
                ? Lottie()
                : Stack(
                    children: [Map(), CustomInfo()],
                  );
          },
        ));
  }

  Center Lottie() => const Center(
        child: SizedBox(
            width: 200,
            height: 200,
            child: LottieProgress(path: AppPaths.lottie_progress)),
      );

  FloatingActionButton FloatButton() {
    return FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          _mapViewModel.getLocation();
          _mapViewModel.fetcAllMaps();
        },
        child: const FaIcon(
          FontAwesomeIcons.locationArrow,
        ));
  }

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
        markers: getMarkers(_mapViewModel.list),
        initialCameraPosition: const CameraPosition(
            target: LatLng(40.599371, 33.610447), zoom: 15.5));
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
                const MyWidget(), LatLng(element.lat!, element.long!));
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(170)));
    }
    return markers;
  }
}
