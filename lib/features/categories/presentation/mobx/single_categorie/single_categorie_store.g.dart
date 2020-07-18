// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_categorie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SingleCategorieStore on _SingleCategorieStore, Store {
  final _$statusPageAtom = Atom(name: '_SingleCategorieStore.statusPage');

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

  final _$servicesAtom = Atom(name: '_SingleCategorieStore.services');

  @override
  ObservableList<ServiceModel> get services {
    _$servicesAtom.reportRead();
    return super.services;
  }

  @override
  set services(ObservableList<ServiceModel> value) {
    _$servicesAtom.reportWrite(value, super.services, () {
      super.services = value;
    });
  }

  final _$fetchDataAsyncAction = AsyncAction('_SingleCategorieStore.fetchData');

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
statusPage: ${statusPage},
services: ${services}
    ''';
  }
}
