import 'package:flutter/material.dart';
import 'package:flutter_gera_renda/core/shared/styles.dart';

import '../../../../../core/shared/colors.dart';
import '../../../../../core/shared/texts/categories_main_text.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../../widgets/grid_button_widget.dart';

class CategoriesMainPage extends StatelessWidget {
  static final String id = 'categories_main_page';

  final List<String> categoriesList = [
    'Mudanca',
    'Casa',
    'Eletrica',
    'Pet',
    'Beleza',
    'Segurança',
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kMainBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            _buildHeader(),
            _buildTextWithRedirect(
                CATEGORIES, () => print('TODAS AS CATEGORIAS')),
            _buildCategoriesGrid(),
            _buildTextWithRedirect(NEARBY_YOU,
                () => print('TODOS ESTABELECIMENTOS PERTO DE VOCÊ')),
            _buildListOfServices()
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 66),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Olá', style: kSecondaryTextStyle),
                Text('Renan', style: kBoldTextStyle),
              ],
            ),
            CircleAvatar()
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return SliverPadding(
      padding: EdgeInsets.only(right: 20, left: 20),
      sliver: SliverGrid.count(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.8,
        children: categoriesList.map((cat) {
          return GridButtonWidget(categorie: cat);
        }).toList(),
      ),
    );
  }

  Widget _buildTextWithRedirect(String text, void Function() onPress) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text, style: kBoldTextStyle),
            GestureDetector(
              onTap: onPress,
              child: Text(VIEW_ALL, style: kGreenTextStyle),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListOfServices() {
    return SliverPadding(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (ctx, index) {
            return _buildListItem();
          },
          childCount: 10,
        ),
      ),
    );
  }

  Widget _buildListItem() {
    return Container(
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
                Expanded(
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
                )
              ],
            ),
          ),
          Divider(color: kDividerGreyColor),
          Expanded(
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
