class SearchResultModel {
  List<ResultService> services;
  List<ResultCategorie> categories;

  SearchResultModel({this.services, this.categories});

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = List<ResultService>();
      json['services'].forEach((v) {
        services.add(ResultService.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['categories'] != null) {
      categories = List<ResultCategorie>();
      json['categories'].forEach((v) {
        categories.add(ResultCategorie.fromJson(v as Map<String, dynamic>));
      });
    }
  }
}

class ResultService {
  int qtdPessoasContato;
  num reviewScore;
  String sId;
  String name;
  String categoria;
  String endereco;
  String telefone;
  String formasPagamento;
  String openingHour;
  String descricao;
  String createdAt;
  String updatedAt;
  int iV;
  String distance;

  ResultService(
      {this.qtdPessoasContato,
      this.reviewScore,
      this.sId,
      this.name,
      this.categoria,
      this.endereco,
      this.telefone,
      this.formasPagamento,
      this.openingHour,
      this.descricao,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.distance});

  ResultService.fromJson(Map<String, dynamic> json) {
    qtdPessoasContato = json['qtdPessoasContato'] as int;
    reviewScore = json['reviewScore'] as num;
    sId = json['_id'] as String;
    name = json['name'] as String;
    categoria = json['categoria'] as String;
    endereco = json['endereco'] as String;
    telefone = json['telefone'] as String;
    formasPagamento = json['formasPagamento'] as String;
    openingHour = json['openingHour'] as String;
    descricao = json['descricao'] as String;
    createdAt = json['createdAt'] as String;
    updatedAt = json['updatedAt'] as String;
    iV = json['__v'] as int;
    distance = json['distance'] as String;
  }
}

class ResultCategorie {
  String sId;
  String name;
  int iV;
  String createdAt;
  String imageUrl;
  String updatedAt;

  ResultCategorie(
      {this.sId,
      this.name,
      this.iV,
      this.createdAt,
      this.imageUrl,
      this.updatedAt});

  ResultCategorie.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String;
    name = json['name'] as String;
    iV = json['__v'] as int;
    createdAt = json['createdAt'] as String;
    imageUrl = json['imageUrl'] as String;
    updatedAt = json['updatedAt'] as String;
  }
}
