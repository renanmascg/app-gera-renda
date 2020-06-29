import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/shared/colors.dart';
import '../categories/presentation/screens/01_categories_main_page/categories_main_page.dart';
import '../categories/presentation/screens/02_all_categories/all_categories_page.dart';
import '../categories/presentation/screens/03_categorie_page/categorie_page.dart';
import '../categories/presentation/screens/04_single_service_page/single_service_page.dart';

class AppRoutes extends StatelessWidget {
  static final String id = 'app_routes';

  final Map<String, Widget Function(BuildContext)> routes = {
    CategoriesMainPage.id: (ctx) => CategoriesMainPage(),
    AllCategoriesPage.id: (ctx) => AllCategoriesPage(),
    CategoriePage.id: (ctx) => CategoriePage(),
    SingleServicePage.id: (ctx) => SingleServicePage()
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: kMainOrangeColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music),
          ),
        ],
      ),
      tabBuilder: (ctx, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              routes: routes,
              builder: (_) {
                return CategoriesMainPage();
              },
            );
          default:
        }

        return null;
      },
    );
  }
}
