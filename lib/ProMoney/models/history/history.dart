class HistoryModel {
  HistoryModel({
    this.type,
    this.detail,
    this.accountNameFrom,
    this.accountIdFrom,
    this.accountNameTo,
    this.accountIdTo,
    this.amount,
    this.date,
    this.fee,
    this.bank,
    this.note,
    this.signflag,
  });

  String? type;
  String? detail;
  String? accountNameFrom;
  String? accountIdFrom;
  String? accountNameTo;
  String? accountIdTo;
  String? amount;
  String? date;
  String? fee;
  String? bank;
  String? note;
  String? signflag;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        type: json["type"],
        detail: json["detail"],
        accountNameFrom: json["account_name_from"],
        accountIdFrom: json["account_id_from"],
        accountNameTo: json["account_name_to"],
        accountIdTo: json["account_id_to"],
        amount: json["amount"],
        date: json["date"],
        fee: json["fee"],
        bank: json["bank"],
        note: json["note"],
        signflag: json["sign_flag"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "detail": detail,
        "account_name_from": accountNameFrom,
        "account_id_from": accountIdFrom,
        "account_name_to": accountNameTo,
        "account_id_to": accountIdTo,
        "amount": amount,
        "date": date,
        "fee": fee,
        "bank": bank,
        "note": note,
        "sign_flag": signflag,
      };
}
