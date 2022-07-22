import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kimyapar/constants/styles.dart';
import 'package:kimyapar/product/widgets/chefMapWidget.dart';
import 'package:kimyapar/product/widgets/chefWidget.dart';
import 'package:kimyapar/models/UserModel.dart';
import 'package:kimyapar/models/chefmodel.dart';
import 'package:kimyapar/services/getUser.dart';
import 'package:custom_info_window/custom_info_window.dart';
import '../languages/tr.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
  }

  final initialPosition =
      CameraPosition(target: LatLng(40.599371, 33.610447), zoom: 15.5);

  final Set<Marker> markers = new Set();
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatButton(),
      body: FutureBuilder<List<UserModel>>(
        future: UserHelper().filterGeo(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasData) {
              return Stack(children: [
                Map(snap),
                CustomInfo(),
              ]);
            } else {
              return const Text(Tr.error);
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  CustomInfoWindow CustomInfo() {
    return CustomInfoWindow(
      controller: _customInfoWindowController,
      height: 75,
      width: 150,
      offset: 50,
    );
  }

  FloatingActionButton floatButton() {
    return FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => setState(() {
              UserHelper().filterGeo();
            }));
  }

  GoogleMap Map(AsyncSnapshot<List<UserModel>> snap) {
    return GoogleMap(
      mapType:MapType.normal,
      initialCameraPosition: initialPosition,
      onMapCreated: (GoogleMapController controller) async {
        _customInfoWindowController.googleMapController = controller;
        
      },
      onCameraMove: (position) {
        _customInfoWindowController.onCameraMove!();
      },
      onTap: (position) {},
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomGesturesEnabled: true,
      markers: getMarkers(snap.data!),
      zoomControlsEnabled: true,
    );
  }

  Set<Marker> getMarkers(List<UserModel> list) {
    list.forEach((element) {
      markers.add(Marker(
          markerId: MarkerId(element.id!.toString()),
          position: LatLng(element.lat!, element.long!),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
                MyWidget(name: element.name!,url:element.imageUrl!), LatLng(element.lat!, element.long!));
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(170)));
    });

    return markers;
  }
}
