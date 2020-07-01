import 'package:flutter/material.dart';

import '../../../../core/shared/texts/categories_main_text.dart';
import '../styles/text_styles.dart';

Widget buildTextWithRedirect(String text, void Function() onPress) {
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
    sliver: SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text, style: kBoldTextStyle),
          GestureDetector(
            onTap: onPress,
            child: Text(VIEW_ALL, style: kGreenTextStyle),
          )
        ],
      ),
    ),
  );
}

Widget buildTextTitle(String text) {
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
    sliver: SliverToBoxAdapter(
      child: Text(text, style: kBoldTextStyle),
    ),
  );
}
