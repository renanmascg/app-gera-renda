import 'formas_pagamento_model.dart';
import 'horario_funcionamento_model.dart';
import 'location_model.dart';
import 'provided_services_model.dart';

class ServiceFullInfo {
  LocationModel location;
  int qtdPessoasReview;
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
      {this.location,
      this.qtdPessoasReview,
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
    location = json['location'] != null
        ? LocationModel.fromJson(json['location'] as Map<String, dynamic>)
        : null;
    qtdPessoasReview = json['qtdPessoasReview'] as int;
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
}
