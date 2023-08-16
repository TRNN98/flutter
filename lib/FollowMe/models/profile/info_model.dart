class InfoModel {
  InfoModel({
    this.membershipNo,
    this.memberFullName,
    this.positionName,
    this.shareStock,
    this.memberGroupName,
    this.salaryAmount,
    this.memTypeDesc,
    this.dateOfBirth,
    this.ageOfBirth,
    this.dateOfApprove,
    this.ageOfApprove,
    this.address,
    this.presentTelephone,
    this.idCard,
  });

  InfoModel.fromJson(dynamic json) {
    membershipNo = json['membership_no'];
    memberFullName = json['member_full_name'];
    positionName = json['position_name'];
    shareStock = json['share_stock'];
    memberGroupName = json['member_group_name'];
    salaryAmount = json['salary_amount'];
    memTypeDesc = json['mem_type_desc'];
    dateOfBirth = json['date_of_birth'];
    ageOfBirth = json['age_of_birth'];
    dateOfApprove = json['date_of_approve'];
    ageOfApprove = json['age_of_approve'];
    address = json['address'];
    presentTelephone = json['present_telephone'];
    idCard = json['id_card'];
  }

  String? membershipNo;
  String? memberFullName;
  String? positionName;
  String? shareStock;
  String? memberGroupName;
  String? salaryAmount;
  String? memTypeDesc;
  String? dateOfBirth;
  String? ageOfBirth;
  String? dateOfApprove;
  String? ageOfApprove;
  String? address;
  String? presentTelephone;
  String? idCard;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['membership_no'] = membershipNo;
    map['member_full_name'] = memberFullName;
    map['position_name'] = positionName;
    map['share_stock'] = shareStock;
    map['member_group_name'] = memberGroupName;
    map['salary_amount'] = salaryAmount;
    map['mem_type_desc'] = memTypeDesc;
    map['date_of_birth'] = dateOfBirth;
    map['age_of_birth'] = ageOfBirth;
    map['date_of_approve'] = dateOfApprove;
    map['age_of_approve'] = ageOfApprove;
    map['address'] = address;
    map['present_telephone'] = presentTelephone;
    map['id_card'] = idCard;
    return map;
  }
}
