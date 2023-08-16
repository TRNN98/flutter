class WelfareReceiveModel {
  WelfareReceiveModel({
    this.welfareDesc,
    this.welfareNo,
    this.receiveName,
    this.relatedNa,
    this.receiveAmount,
    this.receiveDate,
  });

  WelfareReceiveModel.fromJson(dynamic json) {
    welfareDesc = json['welfare_desc'];
    welfareNo = json['welfare_no'];
    receiveName = json['receive_name'];
    relatedNa = json['related_na'];
    receiveAmount = json['receive_amount'];
    receiveDate = json['receive_date'];
  }

  String? welfareDesc;
  String? welfareNo;
  String? receiveName;
  String? relatedNa;
  String? receiveAmount;
  String? receiveDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['welfare_desc'] = welfareDesc;
    map['welfare_no'] = welfareNo;
    map['receive_name'] = receiveName;
    map['related_na'] = relatedNa;
    map['receive_amount'] = receiveAmount;
    map['receive_date'] = receiveDate;
    return map;
  }
}
