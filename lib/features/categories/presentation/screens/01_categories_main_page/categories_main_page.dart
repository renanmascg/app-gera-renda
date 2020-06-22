import 'package:flutter/material.dart';

import '../../../../../core/shared/colors.dart';
import '../../../../../core/shared/texts/categories_main_text.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

class CategoriesMainPage extends StatelessWidget {
  static final String id = 'categories_main_page';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kMainBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            _buildHeader(),
            _buildSearchBox(),
            
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 66),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Bom Dia', style: kSecondaryTextStyle),
                Text('Renan', style: kBoldTextStyle),
              ],
            ),
            CircleAvatar()
          ],
        ),
      ),
    );
  }

  _buildSearchBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTitleText(WHAT_DO_YOU_NEED),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Image.asset('assets/search.png'),
                  border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: kMainTextBoldColor, width: 2.0))),
            )
          ],
        ),
      ),
    );
  }

  _buildTitleText(String text) {
    return Text(
      WHAT_DO_YOU_NEED,
      style: kBoldTextStyle,
      textAlign: TextAlign.start,
    );
  }
}
