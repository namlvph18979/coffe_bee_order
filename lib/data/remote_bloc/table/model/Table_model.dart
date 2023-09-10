class TableModel {
  int? id;
  int? idFloor;
  int? name;
  int? isActive;

  TableModel({
    this.id,
    this.idFloor,
    this.name,
    this.isActive,
  });

  TableModel.fromJson(dynamic json) {
    isActive = json['trangThai'];
    name = json['soBan'];
    id = json['Id_Table'];
    idFloor = json['id_tang'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trangThai'] = isActive;
    map['soBan'] = name;
    map['Id_Table'] = id;
    map['id_tang'] = idFloor;
    return map;
  }

}