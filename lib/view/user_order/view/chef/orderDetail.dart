import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/colors.dart';
import 'package:kimyapar/core/constants/styles/text.dart';
import 'package:kimyapar/product/widgets/order/orderDetail/bottomshetPanel.dart';
import 'package:kimyapar/view/user_order/model/ordermodel.dart';
import 'package:kimyapar/view/user_order/viewmodel/controllers/controller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:timelines/timelines.dart';

import '../../../../core/languages/tr.dart';
import '../../../../product/widgets/order/orderDetail/order_detail_title.dart';
import '../../../login/viewmodel/controllers/loginController.dart';
import '../../model/orderInfo.dart';
import '../../viewmodel/inner_timeline.dart';


const kTileHeight = 50.0;
final orderController = Get.find<OrderController>();
final loginController = Get.find<LoginController>();

class PackageDeliveryTrackingPage extends StatelessWidget {
  var orderController = Get.find<OrderController>();
  final double _initFabHeight = 110.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  final double _panelHeightClosed = 85.0;
  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .35;
    return Scaffold(
        body: SlidingUpPanel(
            backdropTapClosesPanel: true,
            color: Colors.white,
            backdropEnabled: true,
            backdropOpacity: 0.6,
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => orderPanel(sc, context),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }));
  }
}

_body() {
  return StreamBuilder<DocumentSnapshot>(
      stream: orderController.getCurrentOrder(Get.arguments),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.transparent,
            ),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 1,
              itemBuilder: (context, index) {
                var orderModel = OrderModel.fromDocumentSnapshot(
                    snapshot.data! as DocumentSnapshot<Map<String, dynamic>>);

                return Center(
                  child: SizedBox(
                    width: 360.0,
                    child: Card(
                      margin: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: OrderTitle(
                              orderInfo: _data(orderModel),
                            ),
                          ),
                          const Divider(height: 1.0),
                          _DeliveryProcesses(
                              orderModel: orderModel,
                              processes: _data(orderModel).deliveryProcesses),
                          const Divider(height: 5.0),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          return const Center(
            child: Text(Tr.error),
          );
        }
      });
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses(
      {Key? key, required this.processes, required this.orderModel})
      : super(key: key);
  final OrderModel orderModel;
  final List<DeliveryProcess> processes;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: kBigStyle(context),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _timeline(context),
      ),
    );
  }

  _timeline(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        color: const Color(0xff989898),
        indicatorTheme: const IndicatorThemeData(
          position: 0,
          size: 30.0,
        ),
        connectorTheme: const ConnectorThemeData(
          thickness: 2.5,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemCount: processes.length,
        contentsBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  processes[index].name,
                  style: foodNameTextStyle(context),
                ),
                InnerTimeline(messages: processes[index].messages),
              ],
            ),
          );
        },
        indicatorBuilder: (_, index) {
          if (!processes[index].compllete) {
            return const OutlinedDotIndicator(
              borderWidth: 2.5,
              size: 20,
            );
          } else {
            return DotIndicator(
                size: 30,
                color: AppColors.primary,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ));
          }
        },
        connectorBuilder: (_, index, ___) => SolidLineConnector(
          color: AppColors.primary,
        ),
      ),
    );
  }
}

_data(OrderModel orderModel) => OrderInfo(
      date: DateTime.now(),
      driverInfo: DriverInfo(
        name: orderController.orderedModel.value.name!,
        thumbnailUrl: orderController.orderedModel.value.imageUrl!,
      ),
      deliveryProcesses: [
        DeliveryProcess(
          'Siparişi Aldınız',
          orderModel.receivedUser == loginController.model.value.id
              ? true
              : false,
          messages: [
            DeliveryMessage('Yemek:', orderModel.title!),
            const DeliveryMessage('Fiyat:', '20 TL'),
             DeliveryMessage('Detay:', orderModel.desc!),
          ],
        ),
        DeliveryProcess(
          'Hazırla',
          orderModel.status! > 1 ? true : false,
          messages: [
            DeliveryMessage(
                'Başlangıç', orderModel.createdOn!.toDate().toString()),
          ],
        ),
        DeliveryProcess(
          'Yola Çıkar',
          orderModel.status! > 2 ? true : false,
          messages: [
            DeliveryMessage(
                'Başlangıç', orderModel.createdOn!.toDate().toString()),
          ],
        ),
        DeliveryProcess(
          'Teslim Et',
          orderModel.status! > 3 ? true : false,
          messages: [
            DeliveryMessage('', orderModel.adress.toString()),
          ],
        ),
        DeliveryProcess(
          'Tamamlandı',
          orderModel.status! > 4 ? true : false,
          messages: [
            const DeliveryMessage('', 'Alıcı Siparişi Onayladı!'),
          ],
        )
      ],
    );
