class ProvidedServices {
  String sId;
  String name;
  String description;
  int value;
  String createdAt;
  String updatedAt;

  ProvidedServices(
      {this.sId,
      this.name,
      this.description,
      this.value,
      this.createdAt,
      this.updatedAt});

  ProvidedServices.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String;
    name = json['name'] as String;
    description = json['description'] as String;
    value = json['value'] as int;
    createdAt = json['createdAt'] as String;
    updatedAt = json['updatedAt'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['value'] = value;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}