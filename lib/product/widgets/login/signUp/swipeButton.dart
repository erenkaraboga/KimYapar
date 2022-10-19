import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slidable_button/slidable_button.dart';

class SwippableButtonUP extends StatefulWidget {
  const SwippableButtonUP({Key? key}) : super(key: key);
  @override
  State<SwippableButtonUP> createState() => _SwippableButtonUPState();
}

class _SwippableButtonUPState extends State<SwippableButtonUP> {
  @override
  Widget build(BuildContext context) {
    return HorizontalSlidableButton(
      width: MediaQuery.of(context).size.width / 2,
      initialPosition: SlidableButtonPosition.end,
      buttonWidth: 90.0,
      color: Colors.black12,
      buttonColor: Colors.orange.shade200,
      label: const Center(child: Text('Kayıt Ol ')),
      dismissible: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(' Giriş'),
          ],
        ),
      ),
      onChanged: (position) {
        if (position == SlidableButtonPosition.start) {
          Get.offNamed("/signIn");
        } else {
          return;
        }
      },
    );
  }
}
