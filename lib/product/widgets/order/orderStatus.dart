  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/responsive.dart';
import '../../../core/constants/styles/container.dart';
import '../../../core/constants/styles/text.dart';
import '../../../view/user_order/model/ordermodel.dart';


orderStatus(BuildContext context, OrderModel model) {
    return Container(
      decoration: orderStatusBox(),
      height: 27,
      width: Responsive.isTablet(context) ? 180 : 160,
      child: Padding(
          padding: const EdgeInsets.only(left: 4.0), child: checkStatus(context ,model)),
    );
  }

  checkStatus(BuildContext context,OrderModel model) {
    if (model.status == 3 && model.receivedUser != '') {
      return orderStatusBuilder(
          context,
          const Icon(
            Icons.motorcycle,
            color: CupertinoColors.activeGreen,
          ),
          "Yolda");
    } else if (model.status == 2 && model.receivedUser != '') {
      return orderStatusBuilder(
          context,
          const Icon(
            Icons.lock_clock,
            color: Colors.redAccent,
          ),
          "Hazırlanıyor ");
    } else if(model.status ==0 && model.receivedUser == '') {
      return orderStatusBuilder(
          context,
          const Icon(
            Icons.record_voice_over,
            color: Colors.blueGrey,
          ),
          "Şef Bekleniyor");
    }else if(model.status == 1 && model.receivedUser != ''){
      return orderStatusBuilder(
          context,
          const Icon(
            Icons.record_voice_over,
            color: Colors.blueGrey,
          ),
          "Şef Siparişinizi Aldı");
    }
    else if(model.status == 4 && model.receivedUser != ''){
       return orderStatusBuilder(
          context,
          const Icon(
            Icons.record_voice_over,
            color: Colors.blueGrey,
          ),
          "Teslim Aldınız");
    }
    else if(model.status == 5 && model.receivedUser != ''){
       return orderStatusBuilder(
          context,
          const Icon(
            Icons.record_voice_over,
            color: Colors.blueGrey,
          ),
          "Tamamlanan Sipariş");
    }
    

  }

  orderStatusBuilder(BuildContext context, Icon icon, String text) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          text,
          style: ksmallTextStyle(context),
        )
      ],
    );
  }