import 'package:flutter/material.dart';

import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/widgets/review_item_widget.dart';
import '../../../../../core/shared/widgets/simple_widgets.dart';
import '../../../../../core/shared/widgets/sliver_main_header_widget.dart';
import '../05_all_reviews/all_reviews_page.dart';

class SingleServicePage extends StatelessWidget {
  static final String id = 'single_service';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kMainBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverMainHeader(title: Container()),
            _buildHeaderServiceInfo(),
            buildTextTitle('Descrição'),
            _buildDescriptionText(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint '),
            buildTextTitle('Serviços'),
            _buildServiceList(),
            buildTextWithRedirect('Avaliações',
                () => Navigator.pushNamed(context, AllReviewsPage.id)),
            _buildReviewList()
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderServiceInfo() {
    return SliverPadding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Loja do Renan',
              style: kBoldTextStyle,
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[_buildWorkReviewItems(), _buildContactInfo()],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWorkReviewItems() {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildListItemDetailText('124', 'TRABALHOS'),
          SizedBox(width: 10),
          _buildListItemDetailText('300', 'AVALIAÇÕES'),
          SizedBox(width: 10),
          _buildStarRatingIcon('RATING', '3.8')
        ],
      ),
    );
  }

  Widget _buildListItemDetailText(String text, String title,
      {Color color = kMainTextBoldColor}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: kSecondaryTextStyle.copyWith(fontSize: 10),
          textAlign: TextAlign.start,
        ),
        Text(
          text,
          style: kMainTextSemiBold.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        )
      ],
    );
  }

  Widget _buildContactInfo() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildIconButton('phone', () {}),
          SizedBox(width: 15),
          _buildIconButton('message-circle', () {})
        ],
      ),
    );
  }

  Widget _buildIconButton(String text, void Function() onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: kBackgroundIconColor,
          child: Image.asset('assets/service_page/$text.png'),
        ),
      ),
    );
  }

  Widget _buildStarRatingIcon(String title, String rating) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: kSecondaryTextStyle.copyWith(fontSize: 10),
          textAlign: TextAlign.start,
        ),
        Row(
          children: <Widget>[
            Image.asset('assets/star_icon.png'),
            SizedBox(width: 5),
            Text(
              rating,
              style: kMainTextSemiBold.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kMainTextBoldColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescriptionText(String text) {
    return SliverPadding(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Text(text, style: kMainTextRegular),
      ),
    );
  }

  Widget _buildServiceList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((ctx, index) {
        return _listItem('', '', 1500.0);
      }, childCount: 5),
    );
  }

  Widget _listItem(String title, String description, num value) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Broken Pipe',
                  style: kMainTextRegular,
                ),
                Text(
                  'Broken internal pipes within the wall Broken internal pipes within the wall',
                  style: kMainTextSubtitleRegular,
                ),
              ],
            ),
          ),
          SizedBox(width: 5),
          Align(
            alignment: Alignment.center,
            child: Text(
              'R\$ ${value.toStringAsFixed(2)}',
              style: kMainTextRegular,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildReviewList() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((ctx, index) {
          return ReviewItemWidget();
        }, childCount: 3),
      ),
    );
  }
}
