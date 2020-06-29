import 'package:flutter/material.dart';

import '../../../../core/shared/colors.dart';
import '../../../../core/shared/styles.dart';
import '../styles/text_styles.dart';

class ServiceItemWidget extends StatelessWidget {
  final void Function() onTap;

  const ServiceItemWidget({@required this.onTap});

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
                  _buildNameAndReviewsInfo()
                ],
              ),
            ),
            Divider(color: kDividerGreyColor),
            _buildServiceSecondaryInfo()
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
          ),
          Row(
            children: <Widget>[
              Image.asset('assets/star_icon.png'),
              SizedBox(width: 5),
              Text('3.8',
                  style: kBoldTextStyle.copyWith(
                      fontSize: 10, fontWeight: FontWeight.w500)),
              SizedBox(width: 5),
              Text('(805 reviews)',
                  style: kSecondaryTextStyle.copyWith(fontSize: 10))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildServiceSecondaryInfo() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildListItemDetailText('0.5 Km', 'Distancia'),
          _buildListItemDetailText(
            'ABERTO',
            'Status',
            color: kMainGreenColor,
          ),
          Row(
            children: <Widget>[
              Image.asset(
                'assets/categories/casa_icon.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 5),
              Image.asset(
                'assets/categories/eletrica_icon.png',
                width: 30,
                height: 30,
              ),
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
}
