import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

SnackBar errorSnackbar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: kBoldTextStyle.copyWith(
        color: Colors.white,
        fontSize: 14,
      ),
    ),
    backgroundColor: kMainRedColor,
    behavior: SnackBarBehavior.floating,
  );
}
