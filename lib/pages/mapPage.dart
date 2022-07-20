import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

const initialPosition =
    CameraPosition(target: LatLng(40.599371, 33.610447), zoom: 11.5);

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MAP"),
      ),
      body: GoogleMap(initialCameraPosition: initialPosition),
    );
  }
}
