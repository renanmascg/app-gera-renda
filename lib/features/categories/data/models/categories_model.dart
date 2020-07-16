import 'categorie_model.dart';

class CategoriesModel {
  List<CategorieModel> categories;

  CategoriesModel({this.categories});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories =  List<CategorieModel>();
      json['categories'].forEach((v) {
        categories.add( CategorieModel.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (categories != null) {
      data['categories'] = categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
