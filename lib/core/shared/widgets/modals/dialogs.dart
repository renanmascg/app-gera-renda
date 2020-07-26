import 'package:flutter/material.dart';

import '../../styles/colors.dart';

Future loadingDialogs(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      child: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kMainGreenColor),
              ),
            ),
          ),
        ),
      ));
}
