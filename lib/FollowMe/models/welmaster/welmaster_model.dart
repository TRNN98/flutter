class WelMasterModel {
  WelMasterModel(
      {this.welName,
      this.memId,
      this.concernDescription,
      this.memberName,
      this.dateApprove,
      this.status,
      this.statusDescription,
      this.remark});

  WelMasterModel.fromJson(dynamic json) {
    welName = json['wel_name'];
    memId = json['mem_id'];
    concernDescription = json['concern_description'];
    memberName = json['member_name'];
    dateApprove = json['date_approve'];
    status = json['status'];
    statusDescription = json['status_description'];
    remark = json['remark'];
  }
  String? welName;
  String? memId;
  String? concernDescription;
  String? memberName;
  String? dateApprove;
  String? status;
  String? statusDescription;
  String? remark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wel_name'] = welName;
    map['mem_id'] = memId;
    map['concern_description'] = concernDescription;
    map['member_name'] = memberName;
    map['date_approve'] = dateApprove;
    map['status'] = status;
    map['status_description'] = statusDescription;
    map['remark'] = remark;
    return map;
  }
}
