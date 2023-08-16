class CremationModel {
  CremationModel({
    this.ssId,
    this.name,
    this.statusId,
    this.relatedDescription,
    this.statusDescription,
  });

  CremationModel.fromJson(dynamic json) {
    ssId = json['ss_id'];
    name = json['name'];
    statusId = json['status_id'];
    relatedDescription = json['related_description'];
    statusDescription = json['status_description'];
  }

  int? ssId;
  String? name;
  int? statusId;
  String? relatedDescription;
  String? statusDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ss_id'] = ssId;
    map['name'] = name;
    map['status_id'] = statusId;
    map['related_description'] = ssId;
    map['status_description'] = statusDescription;
    return map;
  }
}
