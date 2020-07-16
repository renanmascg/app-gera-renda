import 'service_model.dart';

class ServicesModel {
  List<ServiceModel> services;

  ServicesModel({this.services});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = List<ServiceModel>();
      json['services'].forEach((v) {
        services.add(ServiceModel.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (services != null) {
      data['services'] = services.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
