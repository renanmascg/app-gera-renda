import 'package:flutter/material.dart';

void showGenericModalSheet(BuildContext context, Widget screenWidget) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: true,
    context: context,
    builder: (ctx) {
      return Container(
        height: MediaQuery.of(context).size.height / 2,
        child: screenWidget,
      );
    },
  );
}
