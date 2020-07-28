import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/network/status_page.dart';
import '../../../../../core/services/Service.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/services/get_user_info_service.dart';
import '../../../domain/services/signin_user_service.dart';
import '../../../domain/services/user_is_logged.dart';

part 'login_store.g.dart';

class LoginStore extends _LoginStore with _$LoginStore {
  final SigninUserService getSigninUserService;
  final UserIsLoggedService getUserIsLoggedService;
  final GetUserInfoService getUserInfoService;

  LoginStore(
      {@required this.getSigninUserService,
      @required this.getUserIsLoggedService,
      @required this.getUserInfoService})
      : super(
          signinUserService: getSigninUserService,
          userIsLoggedService: getUserIsLoggedService,
          userInfoService: getUserInfoService,
        );
}

abstract class _LoginStore with Store {
  final SigninUserService signinUserService;
  final UserIsLoggedService userIsLoggedService;
  final GetUserInfoService userInfoService;

  _LoginStore(
      {@required this.signinUserService,
      @required this.userIsLoggedService,
      @required this.userInfoService});

  @observable
  StatusPage statusPage = StatusPage.NORMAL;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isAuthenticated = false;

  UserModel userModel;

  @action
  void changeEmail(String str) {
    email = str;
  }

  @action
  void changePassword(String str) {
    password = str;
  }

  @computed
  bool get isButtonAvailable {
    return email.isNotEmpty && password.isNotEmpty;
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
        userModel = loginModel.user;
        isAuthenticated = true;
      },
    );
  }

  @action
  Future<bool> userIsLogged() async {
    final isTokenValidOrFailure = await userIsLoggedService.exec(NoParams());

    final isValid = isTokenValidOrFailure.fold<bool>((l) => false, (r) => true);

    if (!isValid) return false;

    final userInfoOrFailure = await userInfoService.exec(NoParams());

    final userInfo = userInfoOrFailure.fold<bool>((_) => false, (userModel) {
      this.userModel = userModel;
      return true;
    });

    if (!userInfo) return false;

    return true;
  }
}
