class CreateHDParam {
  String? time_in;
  String? time_out;
  String? Id_user;
  String? time_Data;
  String? tongTien;
  String? trangThai;
  String? id_giamGia;
  String? id_Table;
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
      'Id_Table': this.id_Table,
      'id_hd_items': this.id_hd_items,
    };
  }

  factory CreateHDParam.fromMap(Map<String, dynamic> map) {
    return CreateHDParam(
      time_in: map['time_in'] as String,
      time_out: map['time_out'] as String,
      Id_user: map['Id_user'] as String,
      time_Data: map['time_Data'] as String,
      tongTien: map['tongTien'] as String,
      trangThai: map['trangThai'] as String,
      id_giamGia: map['id_giamGia'] as String,
      id_Table: map['id_Table'] as String,
      id_hd_items: map['id_hd_items'] as String,
    );
  }
}