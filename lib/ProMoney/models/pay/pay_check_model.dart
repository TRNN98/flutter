import 'result.dart';

class PayCheckModel {
  PayCheckModel({
      this.code, 
      this.message, 
      this.result,});

  PayCheckModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? code;
  String? message;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}