import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kimyapar/constants/styles.dart';
import 'package:kimyapar/home.dart';

class ChefContainer extends StatefulWidget {
  const ChefContainer({Key? key}) : super(key: key);

  @override
  State<ChefContainer> createState() => _ChefContainerState();
}

class _ChefContainerState extends State<ChefContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: DescriptionWidget(),
        ),
        AvatarWidget(path: "assets/images/dilara.jpg"),
      ],
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Card(
        elevation: 20,
        shape: const CircleBorder(),
        child: Stack(
          children: [
            Positioned(
              left: 35,
              top: 75,
              child: SizedBox(
                width: 180,
                child: CreateText(
                    text: "Eren KARABOĞA", style: TextStyles.nameStyle),
              ),
            ),
            Positioned(
              left: 57,
              top: 110,
              child: SizedBox(
                width: 180,
                child: CreateTextWithIcon(
                    icon: const Icon(Icons.directions_run),
                    style: TextStyles.distanceStyle,
                    text: "10m İlerinizde"),
              ),
            ),
            Positioned(
                left: 95,
                bottom: 55,
                child: CreateText(
                  style: TextStyles.rateStyle,
                  text: 4.9.toString(),
                )),
            const Positioned(
              left: 75,
              bottom: 30,
              width: 180,
              child: SizedBox(
                child: StarWidget(
                  total: 4,
                  activated: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StarWidget extends StatelessWidget {
  final int total;
  final int activated;

  const StarWidget({Key? key, this.total = 4, required this.activated})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (index) {
        var filled = index < activated;
        return Icon(filled ? Icons.star : Icons.star_border);
      }).toList(),
    );
  }
}

class CreateTextWithIcon extends StatelessWidget {
  const CreateTextWithIcon(
      {Key? key, required this.text, required this.icon, required this.style})
      : super(key: key);
  final Icon icon;
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class CreateText extends StatelessWidget {
  const CreateText({Key? key, required this.text, required this.style})
      : super(key: key);
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    );
  }
}

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({Key? key, required this.path}) : super(key: key);
  final String path;
  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 130,
      child: Card(
        child: ClipOval(child: Image.asset(widget.path)),
        elevation: 5,
        shape: CircleBorder(),
        color: Colors.red,
        margin: EdgeInsets.all(
          19,
        ),
      ),
    );
  }
}
