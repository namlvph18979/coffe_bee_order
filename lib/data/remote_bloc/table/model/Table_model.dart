class TableModel {
  String? id;
  int? idFloor;
  String? name;
  bool? isActive;

  TableModel({
    this.id,
    this.idFloor,
    this.name,
    this.isActive,
  });

  TableModel.fromJson(dynamic json) {
    isActive = json['isActive'];
    name = json['name'];
    id = json['id'];
    idFloor = json['idFloor'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isActive'] = isActive;
    map['name'] = name;
    map['id'] = id;
    map['idFloor'] = idFloor;
    return map;
  }

}