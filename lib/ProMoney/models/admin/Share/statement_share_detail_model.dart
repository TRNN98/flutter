class StatementShareDetailModel {
  StatementShareDetailModel({
    this.dateCompomise,
    this.oldShareAmount,
    this.newShareAmount,
    this.cancelStatus,
  });

  StatementShareDetailModel.fromJson(dynamic json) {
    dateCompomise = json['date_compomise'];
    oldShareAmount = json['old_share_amount'];
    newShareAmount = json['new_share_amount'];
    cancelStatus = json['cancel_status'] ?? "รอนำส่ง#";
  }
  String? dateCompomise;
  String? oldShareAmount;
  String? newShareAmount;
  String? cancelStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date_compomise'] = dateCompomise;
    map['old_share_amount'] = oldShareAmount;
    map['new_share_amount'] = newShareAmount;
    map['cancel_status'] = cancelStatus;
    return map;
  }
}
