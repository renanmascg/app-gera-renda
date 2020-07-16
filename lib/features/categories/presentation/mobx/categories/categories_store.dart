import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/status_page.dart';
import '../../../../../core/services/Service.dart';
import '../../../domain/services/get_all_categories_service.dart';

part 'categories_store.g.dart';

class CategoriesStore extends _CategoriesStore with _$CategoriesStore {
  final GetAllCategoriesService getAllCategoriesService;

  CategoriesStore({@required this.getAllCategoriesService})
      : super(allCategoriesService: getAllCategoriesService);
}

abstract class _CategoriesStore with Store {
  final GetAllCategoriesService allCategoriesService;

  _CategoriesStore({@required this.allCategoriesService});

  @observable
  StatusPage statusPage = StatusPage.NORMAL;

  @observable
  ObservableList categories = ObservableList.of([]);

  @action
  Future<void> fetchData() async {
    statusPage = StatusPage.SEARCHING;

    await _fetchCategories();

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
}
