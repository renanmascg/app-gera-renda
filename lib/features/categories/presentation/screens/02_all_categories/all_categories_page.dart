import 'package:flutter/material.dart';

import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/texts/categories_main_text.dart';
import '../../../../../core/shared/widgets/sliver_main_header_widget.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/categorie_model.dart';
import '../../mobx/categories/categories_store.dart';

class AllCategoriesPage extends StatelessWidget {
  static final String id = 'all_categories';

  final CategoriesStore _store = serviceLocator<CategoriesStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainBackground,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverMainHeader(
            title: Text(
              CATEGORIES,
              style: kBoldTextStyle.copyWith(fontSize: 22),
            ),
          ),
          _buildCategoriesGrid()
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return SliverPadding(
      padding: EdgeInsets.only(right: 20, left: 20, top: 24),
      sliver: SliverGrid.count(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.9,
        children: _store.categories.map((cat) {
          return _buildGridItem(cat);
        }).toList(),
      ),
    );
  }
}

Widget _buildGridItem(CategorieModel categorie) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [kMainBoxShadow],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          categorie.imageUrl,
          width: 55,
          height: 55,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Center(
            child: Text(
              categorie.name,
              style: kGridTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    ),
  );
}
