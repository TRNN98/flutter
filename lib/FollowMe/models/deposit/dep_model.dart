class DepModel {
  DepModel({
    this.depositAccountNo,
    this.depositAccountName,
    this.depositOpenedDate,
    this.depositBalance,
    this.withdrawableAmount,
    this.closeStatus,
    this.accumulateInterest,
    this.depositTypeName,
  });

  DepModel.fromJson(dynamic json) {
    depositAccountNo = json['deposit_account_no'];
    depositAccountName = json['deposit_account_name'];
    depositOpenedDate = json['deposit_opened_date'];
    depositBalance = json['deposit_balance'];
    withdrawableAmount = json["withdrawable_amount"];
    closeStatus = json['close_status'];
    accumulateInterest = json['accumulate_interest'];
    depositTypeName = json['deposit_type_name'];
  }
  String? depositAccountNo;
  String? depositAccountName;
  String? depositOpenedDate;
  String? depositBalance;
  String? withdrawableAmount;
  String? closeStatus;
  dynamic accumulateInterest;
  String? depositTypeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deposit_account_no'] = depositAccountNo;
    map['deposit_account_name'] = depositAccountName;
    map['deposit_opened_date'] = depositOpenedDate;
    map['deposit_balance'] = depositBalance;
    map['withdrawable_amount'] = withdrawableAmount;
    map['close_status'] = closeStatus;
    map['accumulate_interest'] = accumulateInterest;
    map['deposit_type_name'] = depositTypeName;
    return map;
  }
}
