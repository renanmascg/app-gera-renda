import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class ReviewItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [kMainBoxShadow],
        borderRadius: BorderRadius.all(kMainButtonBorderRadius),
      ),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: CircleAvatar(),
        ),
        SizedBox(width: 18),
        _buildColumnBody()
      ],
    );
  }

  Widget _buildColumnBody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildUserNameAndRating(),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          style: kMainTextSubtitleRegular,
          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }

  Widget _buildUserNameAndRating() {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text('Renan', style: kMainTextRegular,),
      subtitle: Text('2 weeks ago', style: kMainTextSubtitleRegular,),
      trailing: _buildStarRatingIcon(3),
    );
  }

  Widget _buildStarRatingIcon(num rating) {
    return SizedBox(
      width: 40,
      child: Row(
        children: <Widget>[
          Image.asset('assets/star_icon.png'),
          SizedBox(width: 5),
          Text(
            rating.toStringAsFixed(1),
            style: kBoldTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
