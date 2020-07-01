import 'package:flutter/material.dart';

import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/widgets/review_item_widget.dart';
import '../../../../../core/shared/widgets/sliver_main_header_widget.dart';

class AllReviewsPage extends StatelessWidget {
  static final String id = 'all_reviews';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kMainBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverMainHeader(
              title: Text(
                'Avaliações',
                style: kBoldTextStyle.copyWith(fontSize: 22),
              ),
            ),
            _buildReviewList()
          ],
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
