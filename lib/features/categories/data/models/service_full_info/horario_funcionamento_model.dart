import 'day_model.dart';

class HorarioFuncionamento {
  Day dom;
  Day seg;
  Day ter;
  Day qua;
  Day qui;
  Day sex;
  Day sab;
  String sId;
  String createdAt;
  String updatedAt;
  int iV;

  HorarioFuncionamento(
      {this.dom,
      this.seg,
      this.ter,
      this.qua,
      this.qui,
      this.sex,
      this.sab,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  HorarioFuncionamento.fromJson(Map<String, dynamic> json) {
    dom = json['dom'] != null
        ? Day.fromJson(json['dom'] as Map<String, dynamic>)
        : null;
    seg = json['seg'] != null
        ? Day.fromJson(json['seg'] as Map<String, dynamic>)
        : null;
    ter = json['ter'] != null
        ? Day.fromJson(json['ter'] as Map<String, dynamic>)
        : null;
    qua = json['qua'] != null
        ? Day.fromJson(json['qua'] as Map<String, dynamic>)
        : null;
    qui = json['qui'] != null
        ? Day.fromJson(json['qui'] as Map<String, dynamic>)
        : null;
    sex = json['sex'] != null
        ? Day.fromJson(json['sex'] as Map<String, dynamic>)
        : null;
    sab = json['sab'] != null
        ? Day.fromJson(json['sab'] as Map<String, dynamic>)
        : null;
    sId = json['_id'] as String;
    createdAt = json['createdAt'] as String;
    updatedAt = json['updatedAt'] as String;
    iV = json['__v'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (dom != null) {
      data['dom'] = dom.toJson();
    }
    if (seg != null) {
      data['seg'] = seg.toJson();
    }
    if (ter != null) {
      data['ter'] = ter.toJson();
    }
    if (qua != null) {
      data['qua'] = qua.toJson();
    }
    if (qui != null) {
      data['qui'] = qui.toJson();
    }
    if (sex != null) {
      data['sex'] = sex.toJson();
    }
    if (sab != null) {
      data['sab'] = sab.toJson();
    }
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
