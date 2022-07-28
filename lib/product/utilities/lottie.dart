import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/path.dart';
class LottieProgress extends StatefulWidget {
  const LottieProgress({Key? key,required this.path}) : super(key: key);
  final String path;
  @override
  State<LottieProgress> createState() => _LottieProgressState();
}

class _LottieProgressState extends State<LottieProgress> {
  @override
  Widget build(BuildContext context) {
     return Lottie.asset(widget.path,
         frameRate: FrameRate.max);
  }
}