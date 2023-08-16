class WelfareModel {
  WelfareModel({
    this.welfareDesc,
    this.welfareNo,
    this.name,
    this.relateNa,
    this.principalBalance,
    this.contractStatus,
    this.contractDes,
    this.recDes,
    this.birthDate,
    this.applyDate,
    this.resignDate,
  });

  WelfareModel.fromJson(dynamic json) {
    welfareDesc = json['welfare_desc'];
    welfareNo = json['welfare_no'];
    name = json['name'];
    relateNa = json['related_na'];
    principalBalance = json["principal_balance"];
    contractStatus = json['contract_status'];
    contractDes = json['contract_des'];
    recDes = json['rec_des'];
    birthDate = json['birth_date'];
    applyDate = json['apply_date'];
    resignDate = json['resign_date'];
  }
  String? welfareDesc;
  String? welfareNo;
  String? name;
  String? relateNa;
  String? principalBalance;
  String? contractStatus;
  String? contractDes;
  String? recDes;
  String? birthDate;
  String? applyDate;
  String? resignDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['welfare_desc'] = welfareDesc;
    map['welfare_no'] = welfareNo;
    map['name'] = name;
    map['related_na'] = relateNa;
    map['principal_balance'] = principalBalance;
    map['contract_status'] = contractStatus;
    map['contract_des'] = contractDes;
    map['rec_des'] = recDes;
    map['birth_date'] = birthDate;
    map['apply_date'] = applyDate;
    map['resign_date'] = resignDate;
    return map;
  }
}
