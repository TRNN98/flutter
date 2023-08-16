const String tableIe = 'ies';
const String columnId = 'id';
const String columnType = 'type';
const String columnDescription = 'description';
const String columnAmount = 'amount';

class IEDb {
  int? id;
  String? type;
  String? description;
  String? amount;

  IEDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnType: type,
      columnDescription: description,
      columnAmount: amount
    };

    // if (id != null) {
    //   map[columnId] = id;
    // }
    return map;
  }

  IEDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    type = map[columnType];
    description = map[columnDescription];
    amount = map[columnAmount];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "description": description,
        "amount": amount,
      };
// @override
// String toString() => "$id, $type,$description,$amount";

}

class IEJsonDb {
  int? id;
  String? type;
  String? description;
  String? amount;

  IEJsonDb(this.id, this.type, this.description, this.amount);

  IEJsonDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    type = map[columnType];
    description = map[columnDescription];
    amount = map[columnAmount];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "description": description,
        "amount": amount,
      };

  @override
  String toString() => "IEJsonDb({$id, $type,$description,$amount})";
}
