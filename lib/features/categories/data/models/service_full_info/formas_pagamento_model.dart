class FormasPagamento {
  List<String> debito;
  List<String> credito;
  List<String> refeicao;
  String sId;
  bool dinheiro;
  String createdAt;
  String updatedAt;
  int iV;

  FormasPagamento(
      {this.debito,
      this.credito,
      this.refeicao,
      this.sId,
      this.dinheiro,
      this.createdAt,
      this.updatedAt,
      this.iV});

  FormasPagamento.fromJson(Map<String, dynamic> json) {
    debito = json['debito'].cast<String>() as List<String>;
    credito = json['credito'].cast<String>() as List<String>;
    refeicao = json['refeicao'].cast<String>() as List<String>;
    sId = json['_id'] as String;
    dinheiro = json['dinheiro'] as bool;
    createdAt = json['createdAt'] as String;
    updatedAt = json['updatedAt'] as String;
    iV = json['__v'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['debito'] = debito;
    data['credito'] = credito;
    data['refeicao'] = refeicao;
    data['_id'] = sId;
    data['dinheiro'] = dinheiro;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}