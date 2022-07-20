import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kimyapar/constants/styles.dart';
import 'package:kimyapar/product/widgets/chefWidget.dart';
import 'package:kimyapar/models/UserModel.dart';
import 'package:kimyapar/models/chefmodel.dart';
import 'package:kimyapar/services/getUser.dart';

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

  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final initialPosition =
      CameraPosition(target: LatLng(40.599371, 33.610447), zoom: 15.5);

  final Set<Marker> markers = new Set();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: floatButton(),
      body: FutureBuilder<List<UserModel>>(
        future: UserHelper().filterGeo(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasData) {
              return Map(snap);
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

  FloatingActionButton floatButton() {
    return FloatingActionButton(

        child: Icon(Icons.refresh),
        onPressed: () => setState(() {
              UserHelper().filterGeo();
              markers.clear();
            
            }));
  }

  GoogleMap Map(AsyncSnapshot<List<UserModel>> snap) {
    return GoogleMap(
              initialCameraPosition: initialPosition,
              onMapCreated: _onMapCreated,
              markers: getMarkers(snap.data!),
              zoomControlsEnabled: false,
            );
  }

  Set<Marker> getMarkers(List<UserModel> list) {
    print("***********");
    print(list.length);
    list.forEach((element) {
      markers.add(Marker(
        markerId: MarkerId("2"),
        position: LatLng(element.lat!, element.long!),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
    print(markers.length);
    return markers;
  }
}
