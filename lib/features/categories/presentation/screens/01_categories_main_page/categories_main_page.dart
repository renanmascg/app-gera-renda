import 'package:flutter/material.dart';

import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/texts/categories_main_text.dart';
import '../../../../../core/shared/widgets/grid_button_widget.dart';
import '../../../../../core/shared/widgets/simple_widgets.dart';
import '../02_all_categories/all_categories_page.dart';

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
            buildTextWithRedirect(CATEGORIES,
                () => Navigator.pushNamed(context, AllCategoriesPage.id)),
            _buildCategoriesGrid(),
            buildTextWithRedirect(NEARBY_YOU,
                () => print('TODOS ESTABELECIMENTOS PERTO DE VOCÊ')),
            buildListOfServices(context)
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
}
