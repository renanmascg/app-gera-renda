class CategorieModel {
  String sId;
  String name;
  int iV;
  String createdAt;
  String imageUrl;
  String updatedAt;

  CategorieModel(
      {this.sId,
      this.name,
      this.iV,
      this.createdAt,
      this.imageUrl,
      this.updatedAt});

  CategorieModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String;
    name = json['name'] as String;
    iV = json['__v'] as int;
    createdAt = json['createdAt'] as String;
    imageUrl = json['imageUrl'] as String;
    updatedAt = json['updatedAt'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['__v'] = iV;
    data['createdAt'] = createdAt;
    data['imageUrl'] = imageUrl;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
