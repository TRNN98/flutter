class Result {
  Result(
      {this.coopAccountType,
      this.coopAccountDesc,
      this.closeStatus,
      this.coopAccountStatus,
      this.coopAccountNo,
      this.coopAccountName,
      this.objective,
      this.accountBalance,
      this.avaliableBalance,
      this.outstandingBalance,
      this.mobileFlag,
      this.withdrawFlag,
      this.depositFlag,
      this.memberCode,
      this.citizenNo,
      this.accountType,
      this.modifyStatus});

  Result.fromJson(dynamic json) {
    coopAccountType = json['coop_account_type'];
    coopAccountDesc = json['coop_account_desc'];
    closeStatus = json['close_status'];
    coopAccountStatus = json['coop_account_status'];
    coopAccountNo = json['coop_account_no'];
    coopAccountName = json['coop_account_name'];
    objective = json['objective'];
    accountBalance = json['account_balance'];
    avaliableBalance = json['avaliable_balance'];
    outstandingBalance = json['outstanding_balance'];
    mobileFlag = json['mobile_flag'];
    withdrawFlag = json['withdraw_flag'];
    depositFlag = json['deposit_flag'];
    memberCode = json['member_code'];
    citizenNo = json['citizen_no'];
    accountType = json['account_type'];
    modifyStatus = json['modify_status'];
  }
  String? coopAccountType;
  String? coopAccountDesc;
  String? closeStatus;
  String? coopAccountStatus;
  String? coopAccountNo;
  String? coopAccountName;
  String? objective;
  dynamic accountBalance;
  dynamic avaliableBalance;
  dynamic outstandingBalance;
  String? mobileFlag;
  String? withdrawFlag;
  String? depositFlag;
  String? memberCode;
  String? citizenNo;
  String? accountType;
  String? modifyStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coop_account_type'] = coopAccountType;
    map['coop_account_desc'] = coopAccountDesc;
    map['close_status'] = closeStatus;
    map['coop_account_status'] = coopAccountStatus;
    map['coop_account_no'] = coopAccountNo;
    map['coop_account_name'] = coopAccountName;
    map['objective'] = objective;
    map['account_balance'] = accountBalance;
    map['avaliable_balance'] = avaliableBalance;
    map['outstanding_balance'] = outstandingBalance;
    map['mobile_flag'] = mobileFlag;
    map['withdraw_flag'] = withdrawFlag;
    map['deposit_flag'] = depositFlag;
    map['member_code'] = memberCode;
    map['citizen_no'] = citizenNo;
    map['account_type'] = accountType;
    map['modify_status'] = modifyStatus;
    return map;
  }
}
