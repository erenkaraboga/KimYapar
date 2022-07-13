import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kimyapar/constants/styles.dart';
import 'package:kimyapar/home.dart';

class ChefsContainer extends StatefulWidget {
  const ChefsContainer({Key? key}) : super(key: key);

  @override
  State<ChefsContainer> createState() => _ChefsContainerState();
}

class _ChefsContainerState extends State<ChefsContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
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
                    Positioned(
                      left: 75,
                      bottom: 30,
                      child: StarWidget(
                        total: 5,
                        activated: 4,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const AvatarWidget(),
        ],
      ),
    ));
  }
}

class StarWidget extends StatelessWidget {
  final int total;
  final int activated;

  const StarWidget({Key? key, this.total = 5, required this.activated})
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

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 130,
      width: 130,
      child: Card(
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
