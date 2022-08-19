import 'package:flutter/material.dart';
import 'package:kimyapar/product/utilities/cached_image.dart';

import '../../../core/constants/path.dart';
import '../../../core/constants/responsive.dart';
import '../../../core/constants/styles/container.dart';
import '../../../view/map/model/UserModel.dart';
import '../../../view/order/model/OrderModel.dart';

userAvatar(BuildContext context, String imagePath) {
  return Container(
    height: Responsive.isTablet(context) ? 90 : 70,
    width: Responsive.isTablet(context) ? 90 : 70,
    decoration: orderUserAvatarBox(),
    child: Center(
      child: SizedBox(
          height: Responsive.isTablet(context) ? 60 : 55,
          width: Responsive.isTablet(context) ? 65 : 55,
          child: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: cachedImage(imagePath),
            ),
          )),
    ),
  );
}
chefAvatar(OrderModel model, BuildContext context, UserModel orderedModel) {
    return model.receivedUser == ''
        ? userAvatar(context, AppPaths.defaultChef)
        : userAvatar(context, orderedModel.imageUrl!);
  }
