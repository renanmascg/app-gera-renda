// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  final _$statusPageAtom = Atom(name: '_SearchStore.statusPage');

  @override
  StatusPage get statusPage {
    _$statusPageAtom.reportRead();
    return super.statusPage;
  }

  @override
  set statusPage(StatusPage value) {
    _$statusPageAtom.reportWrite(value, super.statusPage, () {
      super.statusPage = value;
    });
  }

  final _$recentSearchAtom = Atom(name: '_SearchStore.recentSearch');

  @override
  ObservableList<String> get recentSearch {
    _$recentSearchAtom.reportRead();
    return super.recentSearch;
  }

  @override
  set recentSearch(ObservableList<String> value) {
    _$recentSearchAtom.reportWrite(value, super.recentSearch, () {
      super.recentSearch = value;
    });
  }

  final _$categoriesAtom = Atom(name: '_SearchStore.categories');

  @override
  ObservableList<ResultCategorie> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<ResultCategorie> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$servicesAtom = Atom(name: '_SearchStore.services');

  @override
  ObservableList<ResultService> get services {
    _$servicesAtom.reportRead();
    return super.services;
  }

  @override
  set services(ObservableList<ResultService> value) {
    _$servicesAtom.reportWrite(value, super.services, () {
      super.services = value;
    });
  }

  final _$getRecentSearchWordsAsyncAction =
      AsyncAction('_SearchStore.getRecentSearchWords');

  @override
  Future<dynamic> getRecentSearchWords() {
    return _$getRecentSearchWordsAsyncAction
        .run(() => super.getRecentSearchWords());
  }

  final _$getServicesOrCategorieByWordAsyncAction =
      AsyncAction('_SearchStore.getServicesOrCategorieByWord');

  @override
  Future<dynamic> getServicesOrCategorieByWord(String keyword) {
    return _$getServicesOrCategorieByWordAsyncAction
        .run(() => super.getServicesOrCategorieByWord(keyword));
  }

  @override
  String toString() {
    return '''
statusPage: ${statusPage},
recentSearch: ${recentSearch},
categories: ${categories},
services: ${services}
    ''';
  }
}
