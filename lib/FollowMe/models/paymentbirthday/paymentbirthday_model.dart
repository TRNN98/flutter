class PaymentBirthdayModel {
  PaymentBirthdayModel({
    this.paidYear,
    this.paidDate,
    this.paidAmount,
    this.paidId,
  });

  PaymentBirthdayModel.fromJson(dynamic json) {
    paidYear = json['paid_year'];
    paidDate = json['paid_date'];
    paidAmount = json['paid_amount'];
    paidId = json['paid_id'];
  }
  int? paidYear;
  String? paidDate;
  String? paidAmount;
  String? paidId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['paid_year'] = paidYear;
    map['paid_date'] = paidDate;
    map['paid_amount'] = paidAmount;
    map['paid_id'] = paidId;
    return map;
  }
}
