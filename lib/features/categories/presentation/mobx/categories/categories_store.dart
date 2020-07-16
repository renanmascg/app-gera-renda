import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/network/status_page.dart';
import '../../../../../core/services/Service.dart';
import '../../../data/models/categorie_model.dart';
import '../../../domain/services/get_all_categories_service.dart';
import '../../../domain/services/get_user_location_service.dart';

part 'categories_store.g.dart';

class CategoriesStore extends _CategoriesStore with _$CategoriesStore {
  final GetAllCategoriesService getAllCategoriesService;
  final GetUserLocationService getUserLocationService;

  CategoriesStore({
    @required this.getAllCategoriesService,
    @required this.getUserLocationService,
  }) : super(
          allCategoriesService: getAllCategoriesService,
          userLocationService: getUserLocationService,
        );
}

abstract class _CategoriesStore with Store {
  final GetAllCategoriesService allCategoriesService;
  final GetUserLocationService userLocationService;

  _CategoriesStore({
    @required this.allCategoriesService,
    @required this.userLocationService,
  });

  @observable
  StatusPage statusPage = StatusPage.NORMAL;

  @observable
  ObservableList<CategorieModel> categories = ObservableList.of([]);

  @action
  Future<void> fetchData() async {
    statusPage = StatusPage.SEARCHING;

    await _fetchCategories();
    await _fetchNearServices();

    if (statusPage != StatusPage.ERROR) {
      statusPage = StatusPage.NORMAL;
    }
  }

  Future<void> _fetchCategories() async {
    final allCategoriesOrFailure = await allCategoriesService.exec(NoParams());

    allCategoriesOrFailure.fold((failure) {
      statusPage = StatusPage.ERROR;
    }, (allCategories) {
      categories.clear();
      categories.addAll(allCategories.categories);
    });
  }

  Future<void> _fetchNearServices() async {
    final positionOrFailure = await userLocationService.exec(NoParams());

    positionOrFailure.fold((l) => print('error'), (r) => print(r));
  }
}
