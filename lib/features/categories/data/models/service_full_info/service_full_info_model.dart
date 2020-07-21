import 'formas_pagamento_model.dart';
import 'horario_funcionamento_model.dart';
import 'provided_services_model.dart';

class ServiceFullInfo {
  int qtdPessoasContato;
  num reviewScore;
  String sId;
  String name;
  List<ProvidedServices> services;
  String endereco;
  String telefone;
  FormasPagamento formasPagamento;
  String descricao;
  String createdAt;
  String updatedAt;
  int iV;
  String logoUrl;
  String distance;
  HorarioFuncionamento horarioFuncionamento;
  bool isOpen;
  String categorieUrl;

  ServiceFullInfo(
      {this.qtdPessoasContato,
      this.reviewScore,
      this.sId,
      this.name,
      this.services,
      this.endereco,
      this.telefone,
      this.formasPagamento,
      this.descricao,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.logoUrl,
      this.distance,
      this.horarioFuncionamento,
      this.isOpen,
      this.categorieUrl});

  ServiceFullInfo.fromJson(Map<String, dynamic> json) {
    qtdPessoasContato = json['qtdPessoasContato'] as int;
    reviewScore = json['reviewScore'] as num;
    sId = json['_id'] as String;
    name = json['name'] as String;
    if (json['services'] != null) {
      services = List<ProvidedServices>();
      json['services'].forEach((v) {
        services.add(ProvidedServices.fromJson(v as Map<String, dynamic>));
      });
    }
    endereco = json['endereco'] as String;
    telefone = json['telefone'] as String;
    formasPagamento = json['formasPagamento'] != null
        ? FormasPagamento.fromJson(
            json['formasPagamento'] as Map<String, dynamic>)
        : null;
    descricao = json['descricao'] as String;
    createdAt = json['createdAt'] as String;
    updatedAt = json['updatedAt'] as String;
    iV = json['__v'] as int;
    logoUrl = json['logoUrl'] as String;
    distance = json['distance'] as String;
    horarioFuncionamento = json['horarioFuncionamento'] != null
        ? HorarioFuncionamento.fromJson(
            json['horarioFuncionamento'] as Map<String, dynamic>)
        : null;
    isOpen = json['isOpen'] as bool;
    categorieUrl = json['categorieUrl'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['qtdPessoasContato'] = qtdPessoasContato;
    data['reviewScore'] = reviewScore;
    data['_id'] = sId;
    data['name'] = name;
    if (services != null) {
      data['services'] = services.map((v) => v.toJson()).toList();
    }
    data['endereco'] = endereco;
    data['telefone'] = telefone;
    if (formasPagamento != null) {
      data['formasPagamento'] = formasPagamento.toJson();
    }
    data['descricao'] = descricao;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['logoUrl'] = logoUrl;
    data['distance'] = distance;
    if (horarioFuncionamento != null) {
      data['horarioFuncionamento'] = horarioFuncionamento.toJson();
    }
    data['isOpen'] = isOpen;
    data['categorieUrl'] = categorieUrl;
    return data;
  }
}
