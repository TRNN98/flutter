class DivModel {
  DivModel({
    this.accountYear,
    this.membershipNo,
    this.totalPaid,
    this.dividend,
    this.averageReturn,
    this.dividendRate,
    this.averageRate,
    this.totalSum,
  });

  DivModel.fromJson(dynamic json) {
    accountYear = json['account_year'];
    membershipNo = json['membership_no'];
    totalPaid = json['total_sum'];
    dividend = json['dividend'];
    averageReturn = json['average_return'];
    dividendRate = json['share_rate'];
    averageRate = json['lonint_rate'];
    totalSum = json['total_sum'];
  }
  int? accountYear;
  String? membershipNo;
  String? totalPaid;
  String? dividend;
  String? averageReturn;
  String? dividendRate;
  String? averageRate;
  String? totalSum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_year'] = accountYear;
    map['membership_no'] = membershipNo;
    map['total_sum'] = totalPaid;
    map['dividend'] = dividend;
    map['average_return'] = averageReturn;
    map['share_rate'] = dividendRate;
    map['lonint_rate'] = averageRate;
    map['total_sum'] = totalSum;

    return map;
  }
}
