import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../../core/constants/path.dart';
import '../../product/utilities/lottie.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lottie(),
    );
  }
  lottie() {
    return const Center(
      child: SizedBox(
          width: 200,
          height: 200,
          child: LottieProgress(path: AppPaths.lottie_progress)),
    );
  }
}
