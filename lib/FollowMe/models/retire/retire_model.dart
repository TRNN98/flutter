class RetireModel {
  RetireModel({
    this.yearReceive,
    this.retireDes,
    this.shareStock,
    this.buyShare,
    this.net,
    this.shareAmount,
    this.termAmount,
    this.amount,
  });

  RetireModel.fromJson(dynamic json) {
    yearReceive = json['year_receive'];
    retireDes = json['retire_des'];
    shareStock = json['share_stock'];
    buyShare = json['buy_share'];
    net = json['net'];
    shareAmount = json['share_amount'];
    termAmount = json['term_amount'];
    amount = json['amount'];
  }
  int? yearReceive;
  String? retireDes;
  String? shareStock;
  String? buyShare;
  String? net;
  String? shareAmount;
  String? termAmount;
  String? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year_receive'] = yearReceive;
    map['retire_des'] = retireDes;
    map['share_stock'] = shareStock;
    map['buy_share'] = buyShare;
    map['net'] = net;
    map['share_amount'] = shareAmount;
    map['term_amount'] = termAmount;
    map['amount'] = amount;
    return map;
  }
}
