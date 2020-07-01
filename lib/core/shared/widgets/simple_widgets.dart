import 'package:flutter/material.dart';

import '../../../features/categories/presentation/screens/04_single_service_page/single_service_page.dart';
import '../styles/text_styles.dart';
import '../texts/categories_main_text.dart';
import 'service_item_widget.dart';

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


Widget buildListOfServices(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (ctx, index) {
            return ServiceItemWidget(
              onTap: () => Navigator.pushNamed(context, SingleServicePage.id),
            );
          },
          childCount: 10,
        ),
      ),
    );
  }