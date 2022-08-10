import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/product/widgets/login/signUp/swipeButton.dart';
import 'package:kimyapar/view/login/view/SignUp.dart';
import 'package:slidable_button/slidable_button.dart';

class SwippableButtonIN extends StatefulWidget {
  const SwippableButtonIN({Key? key,}) : super(key: key);
 
  @override
  State<SwippableButtonIN> createState() => SwippableButtonINState();
}

class SwippableButtonINState extends State<SwippableButtonIN> {
  @override
  Widget build(BuildContext context) {
    return HorizontalSlidableButton(
      width: MediaQuery.of(context).size.width / 2,
      initialPosition:SlidableButtonPosition.start ,
      buttonWidth: 90.0,
      color: Colors.black12,
      buttonColor: Colors.orange.shade200,
      label: const Center(child: Text('Giriş')),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Left'),
            Text('Kayıt Ol'),
          ],
        ),
      ),
      onChanged: (position) {
        if (position == SlidableButtonPosition.end) {
          Get.offNamed("/signUp");
        } else {
          return;
        }
      },
    );
  }
}
