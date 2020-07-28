import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/services/create_user_service.dart';

part 'create_profile_store.g.dart';

enum CreateProfileStatus { CREATING, SUCCESS, ERROR, NORMAL }

class CreateProfileStore extends _CreateProfileStore with _$CreateProfileStore {
  final CreateUserService getCreateUserService;

  CreateProfileStore({@required this.getCreateUserService})
      : super(createUserService: getCreateUserService);
}

abstract class _CreateProfileStore with Store {
  final CreateUserService createUserService;

  _CreateProfileStore({@required this.createUserService});

  @observable
  CreateProfileStatus statusPage = CreateProfileStatus.NORMAL;

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool isCreated = false;

  @action
  void changeEmail(String str) {
    email = str;
  }

  @action
  void changeName(String str) {
    name = str;
  }

  @action
  void changePassword(String str) {
    password = str;
  }

  @action
  void changeConfirmPassword(String str) {
    confirmPassword = str;
  }

  @computed
  bool get isEmailButtonAvailable {
    return email.isNotEmpty && name.isNotEmpty;
  }

  @computed
  bool get isPasswordButtonAvailable {
    return password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password.length > 4 &&
        password == confirmPassword;
  }

  @action
  Future<void> createUser() async {
    statusPage = CreateProfileStatus.CREATING;

    final createUserParams =
        CreateUserParams(name: name, email: email, password: password);

    final createOrFailure = await createUserService.exec(createUserParams);

    createOrFailure.fold(
      (l) {
        statusPage = CreateProfileStatus.ERROR;
        isCreated = false;
      },
      (loginModel) {
        statusPage = CreateProfileStatus.SUCCESS;
        isCreated = true;
      },
    );
  }
}
