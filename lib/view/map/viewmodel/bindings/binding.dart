import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:kimyapar/view/map/viewmodel/controllers/mapController.dart';

import '../../../../product/init/network/firebase_init.dart';
import '../../service/MapService.dart';

class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MapController>(MapController(MapService(FirebaseInit.instance.db)));
  }}