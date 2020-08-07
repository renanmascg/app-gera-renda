import 'package:flutter/material.dart';

import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/texts/categories_main_text.dart';
import '../../../../../core/shared/widgets/grid_button_widget.dart';
import '../../../../../core/shared/widgets/sliver_main_header_widget.dart';
import '../../../../../injection_container.dart';
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
          _buildCategoriesGrid(),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return SliverPadding(
      padding: EdgeInsets.only(right: 20, left: 20, top: 24, bottom: 24),
      sliver: SliverGrid.count(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.9,
        children: _store.categories.map((cat) {
          return GridButtonWidget(categorie: cat);
        }).toList(),
      ),
    );
  }
}

