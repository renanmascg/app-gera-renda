import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../categories/presentation/screens/01_categories_main_page/categories_main_page.dart';

class AppRoutes extends StatelessWidget {
  static final id = 'app_routes';

  final routes = {
    CategoriesMainPage.id: (ctx) => CategoriesMainPage(),
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
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
              routes: {},
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
