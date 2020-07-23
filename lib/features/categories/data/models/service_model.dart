class ServiceModel {
  int qtdPessoasReview;
  num reviewScore;
  String sId;
  String name;
  String endereco;
  String telefone;
  String descricao;
  String createdAt;
  String updatedAt;
  int iV;
  String logoUrl;
  String distance;
  bool isOpen;
  String categorieUrl;

  ServiceModel({
    this.qtdPessoasReview,
    this.reviewScore,
    this.sId,
    this.name,
    this.endereco,
    this.telefone,
    this.descricao,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.logoUrl,
    this.distance,
    this.isOpen,
    this.categorieUrl,
  });

  ServiceModel.fromJson(Map<String, dynamic> json) {
    qtdPessoasReview = json['qtdPessoasReview'] as int;
    reviewScore = json['reviewScore'] as num;
    sId = json['_id'] as String;
    name = json['name'] as String;
    endereco = json['endereco'] as String;
    telefone = json['telefone'] as String;
    descricao = json['descricao'] as String;
    createdAt = json['createdAt'] as String;
    updatedAt = json['updatedAt'] as String;
    iV = json['__v'] as int;
    logoUrl = json['logoUrl'] as String;
    distance = json['distance'] as String;
    isOpen = json['isOpen'] as bool;
    categorieUrl = json['categorieUrl'] as String;
  }
}
