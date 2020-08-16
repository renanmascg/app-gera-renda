import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/network/status_page.dart';
import '../../../../../core/services/Service.dart';
import '../../../data/models/search_result_model.dart';
import '../../../domain/services/get_keywords_service.dart';
import '../../../domain/services/get_recent_keywords_service.dart';

part 'search_store.g.dart';

class SearchStore extends _SearchStore with _$SearchStore {
  final GetRecentKeywodsService getRecentKeywodsService;
  final GetKeywordsService getKeywordsService;

  SearchStore({
    @required this.getRecentKeywodsService,
    @required this.getKeywordsService,
  }) : super(
          recentKeywodsService: getRecentKeywodsService,
          keywordsService: getKeywordsService,
        );
}

abstract class _SearchStore with Store {
  final GetRecentKeywodsService recentKeywodsService;
  final GetKeywordsService keywordsService;

  _SearchStore({
    @required this.recentKeywodsService,
    @required this.keywordsService,
  });

  @observable
  StatusPage statusPage = StatusPage.NORMAL;

  @observable
  ObservableList<String> recentSearch = ObservableList.of([]);

  @observable
  ObservableList<ResultCategorie> categories = ObservableList.of([]);

  @observable
  ObservableList<ResultService> services = ObservableList.of([]);

  @action
  Future getRecentSearchWords() async {
    statusPage = StatusPage.SEARCHING;

    recentSearch.clear();

    final wordsOrFailure = await keywordsService.exec(NoParams());

    wordsOrFailure.fold((l) {
      statusPage = StatusPage.ERROR;
    }, (words) {
      recentSearch.addAll(words);
    });

    if (statusPage != StatusPage.ERROR) {
      statusPage = StatusPage.NORMAL;
    }
  }

  @action
  Future getServicesOrCategorieByWord(String keyword) async {
    statusPage = StatusPage.SEARCHING;

    categories.clear();
    services.clear();

    final searchOrFailure =
        await recentKeywodsService.exec(SearchParams(keyword: keyword));

    searchOrFailure.fold((failure) {
      statusPage = StatusPage.ERROR;
    }, (searchResult) {
      categories.addAll(searchResult.categories);
      services.addAll(searchResult.services);
    });

    if (statusPage != StatusPage.ERROR) {
      statusPage = StatusPage.NORMAL;
    }
  }
}
