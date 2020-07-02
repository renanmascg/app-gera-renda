import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/text_styles.dart';
import 'modals/generic_modal_sheet.dart';

class ServiceReviewWidget extends StatelessWidget {
  final void Function() onTap;
  final Widget modalScreen;

  const ServiceReviewWidget({@required this.onTap, @required this.modalScreen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(15),
        height: 130,
        decoration:
            BoxDecoration(color: Colors.white, boxShadow: [kMainBoxShadow]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(),
                  SizedBox(width: 18),
                  _buildNameAndReviewsInfo(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: kMainTextBoldColor,
                    ),
                    color: kMainTextBoldColor,
                  )
                ],
              ),
            ),
            Divider(color: kDividerGreyColor),
            _buildServiceSecondaryInfo(context)
          ],
        ),
      ),
    );
  }

  Widget _buildNameAndReviewsInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'The Plumber Boys',
            style: kBoldTextStyle.copyWith(fontSize: 14),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }

  Widget _buildServiceSecondaryInfo(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildListItemDetailText('02/07/2020', 'Data'),
          _buildListItemRatingText(4),
          Row(
            children: <Widget>[
              _buildIconButton('star', () => showGenericModalSheet(context, modalScreen))
            ],
          )
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
          style: kSecondaryTextStyle.copyWith(fontSize: 8),
          textAlign: TextAlign.start,
        ),
        Text(
          text,
          style: kMainTextSemiBold.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        )
      ],
    );
  }

  Widget _buildListItemRatingText(num nota) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Nota',
          style: kSecondaryTextStyle.copyWith(fontSize: 8),
          textAlign: TextAlign.start,
        ),
        Row(
          children: <Widget>[
            Text(
              nota.toStringAsFixed(1),
              style: kMainTextSemiBold.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: kMainTextBoldColor,
              ),
            ),
            Image.asset('assets/star_icon.png')
          ],
        )
      ],
    );
  }

  Widget _buildIconButton(String text, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: kBackgroundIconColor,
        child: Image.asset('assets/$text.png'),
      ),
    );
  }
}
