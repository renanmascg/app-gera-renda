import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../widgets/review_item_widget.dart';
import '../../widgets/sliver_main_header_widget.dart';

class AllReviewsPage extends StatelessWidget {
  static final String id = 'all_reviews';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kMainBackground,
        child: CustomScrollView(
          slivers: <Widget>[SliverMainHeader(text: 'Avaliações',) ,_buildReviewList()],
        ),
      ),
    );
  }

  Widget _buildReviewList() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (ctx, index) {
            return ReviewItemWidget();
          },
          childCount: 10,
        ),
      ),
    );
  }
}
