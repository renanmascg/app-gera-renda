import 'package:flutter/material.dart';

import '../../../../../core/shared/colors.dart';
import '../../../../../core/shared/styles.dart';
import '../../styles/text_styles.dart';
import '../../widgets/sliver_main_header_widget.dart';

class SingleServicePage extends StatelessWidget {
  static final String id = 'single_service';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverMainHeader(text: ''),
          _buildHeaderServiceInfo()
        ],
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildListItemDetailText('124', 'Trabalhos'),
          SizedBox(width: 10),
          _buildListItemDetailText('300', 'Avaliações'),
          SizedBox(width: 10),
          _buildListItemDetailText('4.5', 'Rating')
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
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: kBackgroundIconColor,
        child: Image.asset('assets/service_page/$text.png'),
      ),
    );
  }
}
