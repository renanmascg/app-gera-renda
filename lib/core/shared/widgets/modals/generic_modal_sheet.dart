import 'package:flutter/material.dart';

import 'sort_modal_widget.dart';

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

void showSortModalSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: true,
    context: context,
    builder: (ctx) {
      return SortModalWidget();
    },
  );
}
