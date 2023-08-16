class GroupLifeModel {
  GroupLifeModel({
    this.year,
    this.beginDate,
    this.endDate,
    this.crem,
    this.lifeAmount,
    this.timeWait,
    this.status,
    this.lifeStatusDescription,
    this.userId,
    this.companyName,
  });

  GroupLifeModel.fromJson(dynamic json) {
    year = json['year'];
    beginDate = json['begin_date'];
    endDate = json['end_date'];
    crem = json['crem'];
    lifeAmount = json['life_amount'];
    timeWait = json['time_wait'];
    status = json['status'];
    lifeStatusDescription = json['life_status_description'];
    userId = json['user_id'];
    companyName = json['company_name'];
  }
  int? year;
  String? beginDate;
  String? endDate;
  String? crem;
  String? lifeAmount;
  String? timeWait;
  String? status;
  String? lifeStatusDescription;
  String? userId;
  String? companyName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = year;
    map['begin_date'] = beginDate;
    map['end_date'] = endDate;
    map['crem'] = crem;
    map['life_amount'] = lifeAmount;
    map['time_wait'] = timeWait;
    map['status'] = status;
    map['life_status_description'] = lifeStatusDescription;
    map['user_id'] = userId;
    map['company_name'] = companyName;

    return map;
  }
}
