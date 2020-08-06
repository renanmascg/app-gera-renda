import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../features/categories/presentation/mobx/single_categorie/single_categorie_store.dart';
import '../../../../injection_container.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

class SortModalWidget extends StatelessWidget {
  final SingleCategorieStore _store = serviceLocator<SingleCategorieStore>();

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
              _buildIconButton(
                context: context,
                icon: FontAwesomeIcons.sort,
                isActive: _store.sortMethod == SortMethod.DEFAULT,
                text: 'Padrão',
                onTap: () {
                  _store.sortMethod = SortMethod.DEFAULT;
                  _store.fetchData();
                },
              ),
              SizedBox(width: 10),
              _buildIconButton(
                  context: context,
                  isActive: _store.sortMethod == SortMethod.DISTANCE,
                  icon: FontAwesomeIcons.mapMarkerAlt,
                  text: 'Distância',
                  onTap: () {
                    _store.sortMethod = SortMethod.DISTANCE;
                    _store.fetchData();
                  }),
              SizedBox(width: 10),
              _buildIconButton(
                context: context,
                isActive: _store.sortMethod == SortMethod.RANKING,
                icon: FontAwesomeIcons.star,
                text: 'Avaliação',
                onTap: () {
                  _store.sortMethod = SortMethod.RANKING;
                  _store.fetchData();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
  
  Widget _buildIconButton({
    BuildContext context,
    bool isActive,
    IconData icon,
    String text,
    void Function() onTap,
  }) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onTap();
          },
          child: CircleAvatar(
            backgroundColor:
                isActive ? kMainGreenColor : kMainGreenColor.withOpacity(0.2),
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
