import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/network/status_page.dart';
import '../../../domain/services/signin_user_service.dart';

part 'login_store.g.dart';

class LoginStore extends _LoginStore with _$LoginStore {
  final SigninUserService getSigninUserService;

  LoginStore({
    @required this.getSigninUserService,
  }) : super(signinUserService: getSigninUserService);
}

abstract class _LoginStore with Store {
  final SigninUserService signinUserService;

  _LoginStore({@required this.signinUserService});

  @observable
  StatusPage statusPage = StatusPage.NORMAL;

  @observable
  String email;

  @observable
  String password;

  @observable
  bool isAuthenticated = false;

  @action
  void changeEmail(String str) {
    email = str;
  }

  @action
  void changePassword(String str) {
    password = str;
  }

  @action
  Future signInUser() async {
    statusPage = StatusPage.SEARCHING;

    final signinParams = SigninParams(email: email, password: password);

    final signinOrFailure = await signinUserService.exec(signinParams);

    signinOrFailure.fold(
      (l) {
        statusPage = StatusPage.ERROR;
        isAuthenticated = false;
      },
      (loginModel) {
        statusPage = StatusPage.NORMAL;
        isAuthenticated = true;
      },
    );
  }
}
