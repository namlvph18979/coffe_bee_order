class EmptyTableModel {
  String? idTable;
  String? idTang;
  String? trangThai;
  String? soBan;

  EmptyTableModel({
      this.idTable, 
      this.idTang, 
      this.trangThai, 
      this.soBan,});

  EmptyTableModel.fromJson(dynamic json) {
    idTable = json['Id_Table'];
    idTang = json['id_tang'];
    trangThai = json['trangThai'];
    soBan = json['soBan'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id_Table'] = idTable;
    map['id_tang'] = idTang;
    map['trangThai'] = trangThai;
    map['soBan'] = soBan;
    return map;
  }

}