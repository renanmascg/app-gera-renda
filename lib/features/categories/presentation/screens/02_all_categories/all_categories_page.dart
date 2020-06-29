import 'package:flutter/material.dart';

import '../../../../../core/shared/styles.dart';
import '../../../../../core/shared/texts/categories_main_text.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../../widgets/sliver_main_header_widget.dart';

class AllCategoriesPage extends StatelessWidget {
  static final String id = 'all_categories';

  final List<String> categoriesList = [
    'Mudanca',
    'Casa',
    'Eletrica',
    'Pet',
    'Beleza',
    'Segurança',
    'Fechadura',
    'Eventos',
    'Beleza',
    'Segurança',
    'Fechadura',
    'Eventos',
    'Beleza',
    'Segurança',
    'Fechadura',
    'Eventos',
    
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kMainBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverMainHeader(text: CATEGORIES),
            _buildCategoriesGrid()
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return SliverPadding(
      padding: EdgeInsets.only(right: 20, left: 20, top: 24),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.5,
        children: categoriesList.map((cat) {
          return _buildGridItem(cat);
        }).toList(),
      ),
    );
  }
}

Widget _buildGridItem(String categorie) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [kMainBoxShadow],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/categories/${categorie.toLowerCase()}_icon.png',
          width: 55,
          height: 55,
        ),
        SizedBox(
          width: 9,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                categorie,
                style: kGridTextStyle,
              ),
              Text('230 Perto de você', style: kSecondaryGridTextStyle,)
            ],
          ),
        )
      ],
    ),
  );
}
