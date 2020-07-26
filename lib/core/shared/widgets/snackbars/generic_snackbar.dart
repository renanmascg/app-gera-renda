import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

SnackBar loginSnackbar() {
  return SnackBar(
    content: Text(
      'Email ou Senha Incorretos',
      style: kBoldTextStyle.copyWith(
        color: Colors.white,
        fontSize: 14,
      ),
    ),
    backgroundColor: kMainRedColor,
    behavior: SnackBarBehavior.floating,
  );
}
