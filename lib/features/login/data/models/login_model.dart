import 'user_model.dart';

class LoginModel {
  UserModel user;
  String token;

  LoginModel({this.user, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null
        ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
        : null;
    token = json['token'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (user != null) {
      data['user'] = user.toJson();
    }
    data['token'] = token;
    return data;
  }
}
