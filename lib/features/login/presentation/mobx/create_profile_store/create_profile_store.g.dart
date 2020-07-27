// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateProfileStore on _CreateProfileStore, Store {
  Computed<bool> _$isEmailButtonAvailableComputed;

  @override
  bool get isEmailButtonAvailable => (_$isEmailButtonAvailableComputed ??=
          Computed<bool>(() => super.isEmailButtonAvailable,
              name: '_CreateProfileStore.isEmailButtonAvailable'))
      .value;
  Computed<bool> _$isPasswordButtonAvailableComputed;

  @override
  bool get isPasswordButtonAvailable => (_$isPasswordButtonAvailableComputed ??=
          Computed<bool>(() => super.isPasswordButtonAvailable,
              name: '_CreateProfileStore.isPasswordButtonAvailable'))
      .value;

  final _$statusPageAtom = Atom(name: '_CreateProfileStore.statusPage');

  @override
  CreateProfileStatus get statusPage {
    _$statusPageAtom.reportRead();
    return super.statusPage;
  }

  @override
  set statusPage(CreateProfileStatus value) {
    _$statusPageAtom.reportWrite(value, super.statusPage, () {
      super.statusPage = value;
    });
  }

  final _$nameAtom = Atom(name: '_CreateProfileStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_CreateProfileStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_CreateProfileStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom =
      Atom(name: '_CreateProfileStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$isCreatedAtom = Atom(name: '_CreateProfileStore.isCreated');

  @override
  bool get isCreated {
    _$isCreatedAtom.reportRead();
    return super.isCreated;
  }

  @override
  set isCreated(bool value) {
    _$isCreatedAtom.reportWrite(value, super.isCreated, () {
      super.isCreated = value;
    });
  }

  final _$createUserAsyncAction = AsyncAction('_CreateProfileStore.createUser');

  @override
  Future<dynamic> createUser() {
    return _$createUserAsyncAction.run(() => super.createUser());
  }

  final _$_CreateProfileStoreActionController =
      ActionController(name: '_CreateProfileStore');

  @override
  void changeEmail(String str) {
    final _$actionInfo = _$_CreateProfileStoreActionController.startAction(
        name: '_CreateProfileStore.changeEmail');
    try {
      return super.changeEmail(str);
    } finally {
      _$_CreateProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeName(String str) {
    final _$actionInfo = _$_CreateProfileStoreActionController.startAction(
        name: '_CreateProfileStore.changeName');
    try {
      return super.changeName(str);
    } finally {
      _$_CreateProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword(String str) {
    final _$actionInfo = _$_CreateProfileStoreActionController.startAction(
        name: '_CreateProfileStore.changePassword');
    try {
      return super.changePassword(str);
    } finally {
      _$_CreateProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeConfirmPassword(String str) {
    final _$actionInfo = _$_CreateProfileStoreActionController.startAction(
        name: '_CreateProfileStore.changeConfirmPassword');
    try {
      return super.changeConfirmPassword(str);
    } finally {
      _$_CreateProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusPage: ${statusPage},
name: ${name},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
isCreated: ${isCreated},
isEmailButtonAvailable: ${isEmailButtonAvailable},
isPasswordButtonAvailable: ${isPasswordButtonAvailable}
    ''';
  }
}
