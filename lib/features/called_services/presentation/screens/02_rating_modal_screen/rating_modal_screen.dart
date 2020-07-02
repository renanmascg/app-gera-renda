import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../login/presentation/widgets/main_button.dart';

class RatingModalScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildServiceInfo(),
          SizedBox(height: 20),
          _buildRatingBar(),
          SizedBox(height: 20),
          Text(
            'O que você achou deste serviço ?',
            style: kMainTextSemiBold.copyWith(fontSize: 14),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            ),
          ),
          SizedBox(height: 25),
          MainButton(
            text: 'Avaliar',
            color: kMainGreenColor,
            onPress: () {},
          )
        ],
      ),
    );
  }

  Widget _buildServiceInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(),
        SizedBox(width: 15),
        Text(
          'Plumber Boys',
          style: kBoldTextStyle,
        )
      ],
    );
  }

  Widget _buildRatingBar() {
    return Center(
      child: RatingBar(
        onRatingUpdate: (newRating) => print(newRating),
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 7),
        itemSize: 25,
        itemBuilder: (context, _) => Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xFFFFED46),
        ),
      ),
    );
  }
}
