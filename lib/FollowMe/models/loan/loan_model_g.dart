class LoanModelG {
  LoanModelG(
      {this.loanContractNo,
      this.principalBalance,
      this.usedAmount,
      this.loanApproveAmount,
      this.refOwnName,
      this.name,
      this.collateralDescription});

  LoanModelG.fromJson(dynamic json) {
    loanContractNo = json['loan_contract_no'];
    principalBalance = json['principal_balance'];
    usedAmount = json['used_amount'];
    loanApproveAmount = json['loan_approve_amount'];
    refOwnName = json['ref_own_name'];
    name = json['name'];
    collateralDescription = json['collateral_description'];
  }
  String? loanContractNo;
  String? principalBalance;
  String? usedAmount;
  String? loanApproveAmount;
  String? refOwnName;
  String? name;
  String? collateralDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loan_contract_no'] = loanContractNo;
    map['principal_balance'] = principalBalance;
    map['used_amount'] = usedAmount;
    map['loan_approve_amount'] = loanApproveAmount;
    map['ref_own_name'] = refOwnName;
    map['name'] = name;
    map['collateral_description'] = collateralDescription;
    return map;
  }
}
