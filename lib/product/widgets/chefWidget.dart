import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kimyapar/constants/styles.dart';
import 'package:kimyapar/core/base/avatar.dart';
import 'package:kimyapar/core/base/star.dart';
import 'package:kimyapar/core/base/text.dart';
import 'package:kimyapar/models/chefmodel.dart';

class ChefContainer extends StatefulWidget {
  const ChefContainer({Key? key, required this.chefModel}) : super(key: key);
  final ChefModel chefModel;
  @override
  State<ChefContainer> createState() => _ChefContainerState();
}

class _ChefContainerState extends State<ChefContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: DescriptionWidget(
              name: widget.chefModel.name,
              distance: widget.chefModel.distance,
              rate: widget.chefModel.rate),
        ),
        AvatarWidget(path: widget.chefModel.imagePath),
      ],
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget(
      {Key? key,
      required this.name,
      required this.distance,
      required this.rate})
      : super(key: key);
  final String name;
  final int distance;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(400), // if you need this
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 35,
              top: 75,
              child: SizedBox(
                width: 180,
                child: CreateText(text: name, style: TextStyles.nameStyle),
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
                    text: distance.toString() + "m" + " İlerinizde!"),
              ),
            ),
            Positioned(
                left: 90,
                bottom: 55,
                child: CreateText(
                  style: TextStyles.rateStyle,
                  text: rate.toString(),
                )),
            Positioned(
              left: 65,
              bottom: 30,
              width: 180,
              child: SizedBox(
                child: calculateStar(rate),
              ),
            )
          ],
        ),
      ),
    );
  }
}




