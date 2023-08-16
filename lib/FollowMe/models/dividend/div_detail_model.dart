class DivDetailModel {
  DivDetailModel({
    this.groupPayCode,
    this.itemAmount,
    this.moneyTypeName,
    this.sortOrder,
    this.bankAccNo,
    this.bankCode,
    this.bankName,
    this.atmStatus,
    this.loanContractNo,
    this.keepingTypeName,
    this.accountYear,
    this.membershipNo,
    this.loanType,
    this.totalInterest,
    this.averAmount,
    this.dropAver,
  });

  DivDetailModel.fromJson(dynamic json) {
    groupPayCode = json['group_pay_code'];
    itemAmount = json['item_amount'];
    moneyTypeName = json['money_type_name'] ?? "";
    sortOrder = json['sort_order'];
    bankAccNo = json['bank_acc_no'] ?? "";
    bankCode = json['bank_code'];
    bankName = json['bank_name'] ?? "";
    atmStatus = json['atm_status'];
    loanContractNo = json['loan_contract_no'] ?? "";
    keepingTypeName = json['keeping_type_name'];
    accountYear = json['account_year'];
    membershipNo = json['membership_no'];
    loanType = json['loan_type'];
    totalInterest = json['total_interest'];
    averAmount = json['aver_amount'];
    dropAver = json['drop_aver'];
  }

  String? groupPayCode;
  String? itemAmount;
  String? moneyTypeName;
  int? sortOrder;
  String? bankAccNo;
  String? bankCode;
  String? bankName;
  String? atmStatus;
  String? loanContractNo;
  String? keepingTypeName;
  int? accountYear;
  String? membershipNo;
  String? loanType;
  String? totalInterest;
  String? averAmount;
  String? dropAver;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['group_pay_code'] = groupPayCode;
    map['item_amount'] = itemAmount;
    map['money_type_name'] = moneyTypeName;
    map['sort_order'] = sortOrder;
    map['bank_acc_no'] = bankAccNo;
    map['bank_code'] = bankCode;
    map['bank_name'] = bankName;
    map['atm_status'] = atmStatus;
    map['loan_contract_no'] = loanContractNo;
    map['keeping_type_name'] = keepingTypeName;
    map['account_year'] = accountYear;
    map['membership_no'] = membershipNo;
    map['loan_type'] = loanType;
    map['total_interest'] = totalInterest;
    map['aver_amount'] = averAmount;
    map['drop_aver'] = dropAver;
    return map;
  }
}
