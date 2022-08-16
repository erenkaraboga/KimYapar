import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kimyapar/core/constants/colors.dart';

class AppIcons {
  static Icon envelope = Icon(
    FontAwesomeIcons.envelope,
    color: AppColors.textFieldIcon,
  );
  static Icon eyeSlash = const Icon(
    FontAwesomeIcons.eyeSlash,
    color: Colors.red,
  );
  static Icon order = const Icon(
    Icons.restaurant,
    color: Colors.orange,
  );
}
