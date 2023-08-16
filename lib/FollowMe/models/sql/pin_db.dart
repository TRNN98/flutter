const String tablePin = 'TBpin';
const String columnId = 'id';
const String columnPinNumber = 'pinnumber';

class PinDb {
  int? id;
  String? pinnumber;

  PinDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnPinNumber: pinnumber,
    };

    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  PinDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    pinnumber = map[columnPinNumber];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "pinnumber": pinnumber,
      };
  @override
  String toString() => "$id, $pinnumber";
}
