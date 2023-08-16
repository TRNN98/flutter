class LinkAccountModel {
  LinkAccountModel({
      this.message, 
      this.url,});

  LinkAccountModel.fromJson(dynamic json) {
    message = json['message'];
    url = json['url'];
  }
  String? message;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['url'] = url;
    return map;
  }

}