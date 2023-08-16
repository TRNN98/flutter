class ShareModelH {
  ShareModelH({
    this.shareAmount,
    this.shareStock,
    this.periodRecrieve,
  });

  ShareModelH.fromJson(dynamic json) {
    shareAmount = json['share_amount'];
    shareStock = json['share_stock'];
    periodRecrieve = json['period_recrieve'].toString();
  }

  String? shareAmount;
  String? shareStock;
  String? periodRecrieve;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['share_amount'] = shareAmount;
    map['share_stock'] = shareStock;
    map['period_recrieve'] = periodRecrieve;
    return map;
  }
}
