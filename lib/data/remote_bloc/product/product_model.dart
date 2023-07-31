class ModelPro {
  String? idSanPham;
  String? idDanhMuc;
  String? giaSanPham;
  String? gioiThieu;
  String? anhSanPham;
  String? idGiamGia;
  String? tenSp;
  String? size;
  int? soluong;
  String? note;

  ModelPro({
    this.idSanPham,
    this.idDanhMuc,
    this.giaSanPham,
    this.gioiThieu,
    this.anhSanPham,
    this.idGiamGia,
    this.tenSp,
    this.soluong = 1,
    this.note,
    this.size,});

  ModelPro.fromJson(dynamic json) {
    idSanPham = json['Id_sanPham'];
    idDanhMuc = json['id_danhMuc'];
    giaSanPham = json['giaSanPham'];
    gioiThieu = json['gioiThieu'];
    anhSanPham = json['anhSanPham'];
    idGiamGia = json['id_giamGia'];
    soluong = int.tryParse(json['soluong']);
    tenSp = json['ten_sp'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id_sanPham'] = idSanPham;
    map['id_danhMuc'] = idDanhMuc;
    map['giaSanPham'] = giaSanPham;
    map['gioiThieu'] = gioiThieu;
    map['anhSanPham'] = anhSanPham;
    map['id_giamGia'] = idGiamGia;
    map['soluong'] = soluong;
    map['ten_sp'] = tenSp;
    map['size'] = size;
    return map;
  }

}