import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/path.dart';
class LottieProgress extends StatefulWidget {
  const LottieProgress({Key? key,required this.url}) : super(key: key);
  final String url;
  @override
  State<LottieProgress> createState() => _LottieProgressState();
}

class _LottieProgressState extends State<LottieProgress> {
  @override
  Widget build(BuildContext context) {
     return Center(
        child: SizedBox(
            height: 200,
            width: 200,
            child: Lottie.network(AppPaths.lottie_progress,
                frameRate: FrameRate.max)));
  }
}