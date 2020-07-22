// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_service_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SingleServiceStore on _SingleServiceStore, Store {
  final _$statusPageAtom = Atom(name: '_SingleServiceStore.statusPage');

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

  final _$serviceFullInfoAtom =
      Atom(name: '_SingleServiceStore.serviceFullInfo');

  @override
  ServiceFullInfo get serviceFullInfo {
    _$serviceFullInfoAtom.reportRead();
    return super.serviceFullInfo;
  }

  @override
  set serviceFullInfo(ServiceFullInfo value) {
    _$serviceFullInfoAtom.reportWrite(value, super.serviceFullInfo, () {
      super.serviceFullInfo = value;
    });
  }

  final _$fetchDataAsyncAction = AsyncAction('_SingleServiceStore.fetchData');

  @override
  Future<void> fetchData(String id) {
    return _$fetchDataAsyncAction.run(() => super.fetchData(id));
  }

  @override
  String toString() {
    return '''
statusPage: ${statusPage},
serviceFullInfo: ${serviceFullInfo}
    ''';
  }
}
