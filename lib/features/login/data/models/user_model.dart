class UserModel {
  String imageUrl;
  String sId;
  String name;
  String email;
  String createdAt;
  String updatedAt;

  UserModel({
    this.imageUrl,
    this.sId,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'] as String;
    sId = json['_id'] as String;
    name = json['name'] as String;
    email = json['email'] as String;
    createdAt = json['createdAt'] as String;
    updatedAt = json['updatedAt'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['imageUrl'] = imageUrl;
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
