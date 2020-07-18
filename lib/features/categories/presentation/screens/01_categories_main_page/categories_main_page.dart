import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/network/status_page.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/texts/categories_main_text.dart';
import '../../../../../core/shared/widgets/grid_button_widget.dart';
import '../../../../../core/shared/widgets/simple_widgets.dart';
import '../../../../../injection_container.dart';
import '../../mobx/categories/categories_store.dart';
import '../02_all_categories/all_categories_page.dart';

class CategoriesMainPage extends StatefulWidget {
  static final String id = 'categories_main_page';

  @override
  _CategoriesMainPageState createState() => _CategoriesMainPageState();
}

class _CategoriesMainPageState extends State<CategoriesMainPage> {
  final CategoriesStore _store = serviceLocator<CategoriesStore>();

  final List<String> categoriesList = [
    'Mudanca',
    'Casa',
    'Eletrica',
    'Pet',
    'Beleza',
    'Segurança',
  ];

  @override
  void initState() {
    super.initState();
    _store.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (ctx) {
        if (_store.statusPage != StatusPage.NORMAL) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return CustomScrollView(
          slivers: <Widget>[
            _buildHeader(),
            buildTextWithRedirect(CATEGORIES,
                () => Navigator.pushNamed(context, AllCategoriesPage.id)),
            _buildCategoriesGrid(),
            buildTextWithRedirect(NEARBY_YOU,
                () => print('TODOS ESTABELECIMENTOS PERTO DE VOCÊ')),
            buildListOfServices(context, _store.services)
          ],
        );
      },
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
        children: _store.categories.getRange(0, 6).map((cat) {
          return GridButtonWidget(categorie: cat);
        }).toList(),
      ),
    );
  }
}
