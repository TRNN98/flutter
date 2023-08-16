class AdminIoModel {
  AdminIoModel({
    this.requestmentNo,
    this.operateDate,
    this.docDesc,
  });

  AdminIoModel.fromJson(dynamic json) {
    requestmentNo = json['requestment_no'];
    operateDate = json['operate_date'];
    docDesc = json['doc_desc'];
  }
  String? requestmentNo;
  String? operateDate;
  String? docDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requestment_no'] = requestmentNo;
    map['operate_date'] = operateDate;
    map['doc_desc'] = docDesc;
    return map;
  }
}

class AdminIoDetailModel {
  AdminIoDetailModel({
    this.io,
    this.tdata,
    this.requestmentNo,
    this.loanContractNo,
    this.membershipNo,
    this.operateDate,
    this.docType,
    this.docDesc,
    this.docStatus,
    this.docStatusDesc,
    this.docAmount,
    this.remark,
    this.remark2,
    this.remark3,
    this.entryName,
    this.detail,
  });

  AdminIoDetailModel.fromJson(dynamic json) {
    io = json["io"];
    tdata = json["tdata"];
    requestmentNo = json["requestment_no"];
    loanContractNo = json["loan_contract_no"];
    membershipNo = json["membership_no"];
    operateDate = json["operate_date"];
    docType = json["doc_type"];
    docDesc = json["doc_desc"];
    docStatus = json["doc_status"];
    docStatusDesc = json["doc_status_desc"];
    docAmount = json["doc_amount"];
    remark = json["remark"];
    remark2 = json["remark2"];
    remark3 = json["remark3"];
    entryName = json["entry_name"];
    detail = json["detail"];
  }

  String? io;
  String? tdata;
  String? requestmentNo;
  String? loanContractNo;
  String? membershipNo;
  String? operateDate;
  String? docType;
  String? docDesc;
  String? docStatus;
  String? docStatusDesc;
  String? docAmount;
  String? remark;
  String? remark2;
  String? remark3;
  String? entryName;
  String? detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requestment_no'] = requestmentNo;
    map['operate_date'] = operateDate;
    map['doc_desc'] = docDesc;

    map['io'] = io;
    map['tdata'] = tdata;
    map['requestment_no'] = requestmentNo;
    map['loan_contract_no'] = loanContractNo;
    map['membership_no'] = membershipNo;
    map['operate_date'] = operateDate;
    map['doc_type'] = docType;
    map['doc_desc'] = docDesc;
    map['doc_status'] = docStatus;
    map['doc_status_desc'] = docStatusDesc;
    map['doc_amount'] = docAmount;
    map['remark'] = remark;
    map['remark2'] = remark2;
    map['remark3'] = remark3;
    map['entry_name'] = entryName;
    map['detail'] = detail;

    return map;
  }
}
