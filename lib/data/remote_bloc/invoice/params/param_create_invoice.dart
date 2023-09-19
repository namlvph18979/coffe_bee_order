class CreateHDParam {
  String? time_in;
  String? time_out;
  int? Id_user;
  String? time_Data;
  int? tongTien;
  int? trangThai;
  int? id_giamGia;
  int? id_Table;
  int? id_tang;
  String? id_hd_items;


  CreateHDParam({
      this.time_in,
      this.time_out,
      this.Id_user,
      this.time_Data,
      this.tongTien,
      this.trangThai,
      this.id_giamGia,
      this.id_Table,
      this.id_tang,
      this.id_hd_items});

  Map<String, dynamic> toMap() {
    return {
      'time_in': this.time_in,
      'time_out': this.time_out,
      'Id_user': this.Id_user,
      'time_Data': this.time_Data,
      'tongTien': this.tongTien,
      'trangThai': this.trangThai,
      'id_giamGia': this.id_giamGia,
      if(id_Table != null && id_Table != "")
        'Id_Table': this.id_Table,
      'id_hd_items': this.id_hd_items,
    };
  }

  factory CreateHDParam.fromMap(Map<String, dynamic> map) {
    return CreateHDParam(
      time_in: map['time_in'] as String,
      time_out: map['time_out'] as String,
      Id_user: map['Id_user'] as int,
      time_Data: map['time_Data'] as String,
      tongTien: map['tongTien'] as int,
      trangThai: map['trangThai'] as int,
      id_giamGia: map['id_giamGia'] as int,
      id_Table: map['Id_Table'] as int,
      id_hd_items: map['id_hd_items'] as String,
    );
  }
}