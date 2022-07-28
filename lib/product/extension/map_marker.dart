import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kimyapar/product/widgets/map/mapInfoWindow.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';

CustomInfoWindowController _customInfoWindowController =
    CustomInfoWindowController();

extension MapMarkersExtension on List<UserModel> {
  Set<Marker> toMarkers() {
    return Set.of(map((e) => Marker(
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
                Text("asfsafasf"), LatLng(e.lat!, e.long!));
          },
          markerId: MarkerId(e.id.toString()),
          position: LatLng(e.lat!, e.long!),
        )));
  }
}
