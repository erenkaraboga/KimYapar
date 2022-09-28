import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/product/utilities/qr_code/qr_code_camera_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../view/user_order/viewmodel/controllers/controller.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({Key? key}) : super(key: key);

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  @override
  void dispose() {
    super.dispose();
  }

  var orderController = Get.find<OrderController>();
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
         MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                debugPrint('Barcode found!',);
                debugPrint(code);
                orderController.qr.value = code;
                orderController.finishOrder();
              }
            }),
        const QRScannerOverlay(
          overlayColour: Colors.transparent,
        )
      ],
    ));
  }
   

}
