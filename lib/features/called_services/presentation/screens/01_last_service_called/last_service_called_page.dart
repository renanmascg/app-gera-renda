import 'package:flutter/material.dart';

import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/widgets/service_review_widget.dart';
import '../02_rating_modal_screen/rating_modal_screen.dart';

class LastServiceCalledPage extends StatelessWidget {
  static final String id = 'last_service_called';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kMainBackground,
      child: CustomScrollView(
        slivers: <Widget>[_buildHeader(), _buildListCalledServices()],
      ),
    );
  }

  Widget _buildHeader() {
    return SliverAppBar(
      backgroundColor: kMainBackground,
      elevation: 0,
      pinned: true,
      title: Text('Serviços Recentes', style: kBoldTextStyle),
      centerTitle: false,
    );
  }

  Widget _buildListCalledServices() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((ctx, index) {
          return ServiceReviewWidget(
            onTap: () {},
            modalScreen: RatingModalScreenPage(),
          );
        }, childCount: 5),
      ),
    );
  }
}
