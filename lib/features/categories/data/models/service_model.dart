class ServiceModel {
  int qtdPessoasContato;
  int reviewScore;
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

  ServiceModel(
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

  ServiceModel.fromJson(Map<String, dynamic> json) {
    qtdPessoasContato = json['qtdPessoasContato'] as int;
    reviewScore = json['reviewScore'] as int;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['qtdPessoasContato'] = qtdPessoasContato;
    data['reviewScore'] = reviewScore;
    data['_id'] = sId;
    data['name'] = name;
    data['categoria'] = categoria;
    data['endereco'] = endereco;
    data['telefone'] = telefone;
    data['formasPagamento'] = formasPagamento;
    data['openingHour'] = openingHour;
    data['descricao'] = descricao;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['distance'] = distance;
    return data;
  }
}
