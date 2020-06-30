import 'package:flutter/material.dart';

import 'colors.dart';

final Radius kMainButtonBorderRadius = Radius.circular(6);

final BoxShadow kMainBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(0.06),
  blurRadius: 4,
  offset: Offset(0, 4),
);

final TextStyle kMainLoginHeaderText = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 22,
    color: kMainGreenColor);

final TextStyle kMainTextSemiBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: kMainTextBoldColor);

final TextStyle kMainTextRegular = TextStyle(
  fontFamily: 'Poppins',
  color: kMainTextBoldColor,
  fontSize: 12,
  fontWeight: FontWeight.w500
);

final TextStyle kMainTextFieldText = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
  fontSize: 18,
  color: kMainTextBoldColor,
);

final TextStyle kMainTextSubtitleRegular = TextStyle(
  fontSize: 10,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.normal,
  color: kMainTextBoldColor.withOpacity(0.62)
);
