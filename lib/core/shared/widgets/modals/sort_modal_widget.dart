import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../features/categories/presentation/mobx/single_categorie/single_categorie_store.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

class SortModalWidget extends StatelessWidget {
  final SingleCategorieStore store;

  const SortModalWidget({this.store});

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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Ordenar por',
            style: kBoldTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildIconButton(context, FontAwesomeIcons.sort, 'Padrão', () {}),
              SizedBox(width: 10),
              _buildIconButton(
                  context, FontAwesomeIcons.mapMarkerAlt, 'Distância', () {}),
              SizedBox(width: 10),
              _buildIconButton(
                  context, FontAwesomeIcons.star, 'Avaliação', () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIconButton(
    BuildContext context,
    IconData icon,
    String text,
    void Function() onTap,
  ) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onTap();
          },
          child: CircleAvatar(
            backgroundColor: kMainGreenColor.withOpacity(0.2),
            radius: 40,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          textAlign: TextAlign.center,
          style: kGridTextStyle,
        )
      ],
    );
  }
}
