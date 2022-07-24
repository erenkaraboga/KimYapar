import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';

extension MapMarkersExtension on List<UserModel> {
  Set<Marker> toMarkers() {
    return Set.of(map((e) => Marker(
        markerId: MarkerId(e.id.toString()),
        position: LatLng(e.lat!, e.long!))));
  }
}
