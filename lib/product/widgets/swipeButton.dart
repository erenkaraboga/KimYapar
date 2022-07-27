import 'package:flutter/material.dart';
import 'package:kimyapar/view/login/SignUp.dart';
import 'package:slidable_button/slidable_button.dart';

class SwippableButton extends StatefulWidget {
  const SwippableButton({Key? key, required this.position}) : super(key: key);
  final SlidableButtonPosition position;
  @override
  State<SwippableButton> createState() => _SwippableButtonState();
}

class _SwippableButtonState extends State<SwippableButton> {
  @override
  Widget build(BuildContext context) {
    return HorizontalSlidableButton(
      width: MediaQuery.of(context).size.width / 2,
      initialPosition: widget.position,
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
          Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true, builder: (context) => const SignUp()),
          );
        } else {
          return;
        }
      },
    );
  }
}
