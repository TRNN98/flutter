class CreditInsureModel {
  CreditInsureModel({
    this.loanContractNo,
    this.loanTypeDescription,
    this.feeName,
    this.beginingOfContract,
    this.feeApprove,
    this.creditInsurance,
    this.fireInsurance,
    this.principalBalance,
    this.remark,
    this.companyName,
    this.insurExpireDate,
  });

  CreditInsureModel.fromJson(dynamic json) {
    loanContractNo = json['loan_contract_no'];
    loanTypeDescription = json['loan_type_description'];
    feeName = json['fee_name'];
    beginingOfContract = json['begining_of_contract'];
    feeApprove = json['fee_approve'];
    creditInsurance = json['credit_insurance'];
    fireInsurance = json['fire_insurance'];
    principalBalance = json['principal_balance'];
    remark = json['remark'];
    companyName = json['company_name'];
    insurExpireDate = json['insur_expire_date'];
  }

  String? loanContractNo;
  String? loanTypeDescription;
  String? feeName;
  String? beginingOfContract;
  String? feeApprove;
  String? creditInsurance;
  String? fireInsurance;
  String? principalBalance;
  String? remark;
  String? companyName;
  String? insurExpireDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loan_contract_no'] = loanContractNo;
    map['loan_type_description'] = loanTypeDescription;
    map['fee_name'] = feeName;
    map['begining_of_contract'] = beginingOfContract;
    map['fee_approve'] = feeApprove;
    map['credit_insurance'] = creditInsurance;
    map['fire_insurance'] = fireInsurance;
    map['principal_balance'] = principalBalance;
    map['remark'] = remark;
    map['company_name'] = companyName;
    map['insur_expire_date'] = insurExpireDate;
    return map;
  }
}
