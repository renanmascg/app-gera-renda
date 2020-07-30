import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/shared/styles/colors.dart';
import '../called_services/presentation/screens/01_last_service_called/last_service_called_page.dart';
import '../categories/presentation/screens/01_categories_main_page/categories_main_page.dart';
import '../categories/presentation/screens/02_all_categories/all_categories_page.dart';
import '../categories/presentation/screens/03_categorie_page/categorie_page.dart';
import '../categories/presentation/screens/04_single_service_page/single_service_page.dart';
import '../categories/presentation/screens/05_all_reviews/all_reviews_page.dart';
import '../profile/presentation/01_main_profile_page/main_profile_page.dart';
import '../search/presentation/screens/01_search_page/search_page.dart';
import '../search/presentation/screens/02_search_found_page/search_found_page.dart';

class AppRoutes extends StatefulWidget {
  static final String id = 'app_routes';

  @override
  _AppRoutesState createState() => _AppRoutesState();
}

class _AppRoutesState extends State<AppRoutes> {
  final CupertinoTabController controller = CupertinoTabController();

  final GlobalKey<NavigatorState> categoriesMainTabNavKey =
      GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> searchTabNavKey = GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> lastSearchTabNavKey =
      GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> mainProfileTabNavKey =
      GlobalKey<NavigatorState>();

  final Map<String, Widget Function(BuildContext)> routes = {
    CategoriesMainPage.id: (ctx) => CategoriesMainPage(),
    AllCategoriesPage.id: (ctx) => AllCategoriesPage(),
    CategoriePage.id: (ctx) => CategoriePage(),
    SingleServicePage.id: (ctx) => SingleServicePage(),
    AllReviewsPage.id: (ctx) => AllReviewsPage(),
    SearchPage.id: (ctx) => SearchPage(),
    SearchFoundPage.id: (ctx) => SearchFoundPage(),
    LastServiceCalledPage.id: (ctx) => LastServiceCalledPage(),
    MainProfilePage.id: (ctx) => MainProfilePage()
  };

  GlobalKey<NavigatorState> currentNavigatorKey() {
    switch (controller.index) {
      case 0:
        return categoriesMainTabNavKey;
        break;
      case 1:
        return searchTabNavKey;
        break;
      case 2:
        return lastSearchTabNavKey;
        break;
      case 3:
        return mainProfileTabNavKey;
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await currentNavigatorKey().currentState.maybePop();
      },
      child: Material(
        child: CupertinoTabScaffold(
          controller: controller,
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.white,
            activeColor: kMainTextBoldColor,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.home, size: 20)),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.search, size: 20)),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.briefcase, size: 20)),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.userCircle, size: 20)),
            ],
          ),
          backgroundColor: kMainBackground,
          tabBuilder: (ctx, index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  navigatorKey: categoriesMainTabNavKey,
                  routes: routes,
                  builder: (_) {
                    return CategoriesMainPage();
                  },
                );
              case 1:
                return CupertinoTabView(
                  navigatorKey: searchTabNavKey,
                  routes: routes,
                  builder: (_) {
                    return SearchPage();
                  },
                );
              case 2:
                return CupertinoTabView(
                  navigatorKey: lastSearchTabNavKey,
                  routes: routes,
                  builder: (_) {
                    return LastServiceCalledPage();
                  },
                );
              case 3:
                return CupertinoTabView(
                  navigatorKey: mainProfileTabNavKey,
                  routes: routes,
                  builder: (_) {
                    return MainProfilePage();
                  },
                );
              default:
            }
            return null;
          },
        ),
      ),
    );
  }
}
