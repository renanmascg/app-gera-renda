class LocationModel {
  String type;
  List<double> coordinates;

  LocationModel({this.type, this.coordinates});

  LocationModel.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String;
    coordinates = json['coordinates'].cast<double>() as List<double>;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}
