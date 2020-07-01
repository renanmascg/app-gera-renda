import 'package:flutter/material.dart';

import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/widgets/grid_button_widget.dart';
import '../../../../../core/shared/widgets/simple_widgets.dart';
import '../02_search_found_page/search_found_page.dart';

class SearchPage extends StatelessWidget {
  static final String id = 'search_page';

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
      color: kMainBackground,
      child: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(context),
          buildTextTitle('Pesquisas Recentes'),
          _buildRecentSearch(context),
          buildTextTitle('Categorias'),
          _buildCategoriesGrid()
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kMainBackground,
      elevation: 0,
      pinned: true,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          onSubmitted: (str) =>
              Navigator.pushNamed(context, SearchFoundPage.id),
          decoration: InputDecoration(
            hintText: 'Nome da Loja',
            prefixIcon: Image.asset('assets/search.png'),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentSearch(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: ListTile.divideTiles(
            context: context,
            color: kTextSecondaryGreyColor.withOpacity(0.5),
            tiles: [
              ListTile(
                leading: Icon(
                  Icons.history,
                  color: kTextSecondaryGreyColor,
                ),
                title: Text(
                  'Madero',
                  style: kMainTextRegular,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.history,
                  color: kTextSecondaryGreyColor,
                ),
                title: Text(
                  'Madero',
                  style: kMainTextRegular,
                ),
              )
            ],
          ).toList(),
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
