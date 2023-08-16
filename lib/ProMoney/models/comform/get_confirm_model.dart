class GetConFirmModel {
  GetConFirmModel({
      this.code, 
      this.message, 
      this.result,});

  GetConFirmModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? code;
  String? message;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}

class Result {
  Result({
      this.channel, 
      this.fromAccountName, 
      this.fromCoopAccountNo, 
      this.toAccountName, 
      this.toCoopAccountNo, 
      this.fromBayAccountNo, 
      this.toBayAccountNo, 
      this.transactionType, 
      this.transactionAmount, 
      this.transactionFee, 
      this.note, 
      this.transactionDate, 
      this.coopTransactionNo, 
      this.principalAmount, 
      this.interestAmount,});

  Result.fromJson(dynamic json) {
    channel = json['channel'];
    fromAccountName = json['from_account_name'];
    fromCoopAccountNo = json['from_coop_account_no'];
    toAccountName = json['to_account_name'];
    toCoopAccountNo = json['to_coop_account_no'];
    fromBayAccountNo = json['from_bay_account_no'];
    toBayAccountNo = json['to_bay_account_no'];
    transactionType = json['transaction_type'];
    transactionAmount = json['transaction_amount'];
    transactionFee = json['transaction_fee'];
    note = json['note'];
    transactionDate = json['transaction_date'];
    coopTransactionNo = json['coop_transaction_no'];
    principalAmount = json['principal_amount'];
    interestAmount = json['interest_amount'];
  }
  String? channel;
  String? fromAccountName;
  String? fromCoopAccountNo;
  String? toAccountName;
  String? toCoopAccountNo;
  String? fromBayAccountNo;
  String? toBayAccountNo;
  String? transactionType;
  String? transactionAmount;
  String? transactionFee;
  String? note;
  String? transactionDate;
  String? coopTransactionNo;
  String? principalAmount;
  String? interestAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channel'] = channel;
    map['from_account_name'] = fromAccountName;
    map['from_coop_account_no'] = fromCoopAccountNo;
    map['to_account_name'] = toAccountName;
    map['to_coop_account_no'] = toCoopAccountNo;
    map['from_bay_account_no'] = fromBayAccountNo;
    map['to_bay_account_no'] = toBayAccountNo;
    map['transaction_type'] = transactionType;
    map['transaction_amount'] = transactionAmount;
    map['transaction_fee'] = transactionFee;
    map['note'] = note;
    map['transaction_date'] = transactionDate;
    map['coop_transaction_no'] = coopTransactionNo;
    map['principal_amount'] = principalAmount;
    map['interest_amount'] = interestAmount;
    return map;
  }

}