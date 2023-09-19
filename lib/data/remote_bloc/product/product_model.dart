class ModelPro {
  String? idSanPham;
  String? idDanhMuc;
  String? giaSanPham;
  String? gioiThieu;
  String? anhSanPham;
  String? idGiamGia;
  String? tenSp;
  String? size;
  // String? note;
  int? soluong;

  ModelPro(
      {this.idSanPham,
        this.idDanhMuc,
        this.giaSanPham,
        this.gioiThieu,
        this.anhSanPham,
        this.idGiamGia,
        this.tenSp,
        this.size,
        // this.note,
        this.soluong = 1,
      });

  ModelPro.fromJson(Map<String, dynamic> json) {
    idSanPham = json['Id_sanPham'];
    idDanhMuc = json['id_danhMuc'];
    giaSanPham = json['giaSanPham'];
    gioiThieu = json['gioiThieu'];
    anhSanPham = json['anhSanPham'].substring(2) as String;
    idGiamGia = json['id_giamGia'];
    tenSp = json['ten_sp'];
    size = json['size'];
    // note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id_sanPham'] = this.idSanPham;
    data['id_danhMuc'] = this.idDanhMuc;
    data['giaSanPham'] = this.giaSanPham;
    data['gioiThieu'] = this.gioiThieu;
    data['anhSanPham'] = this.anhSanPham;
    data['id_giamGia'] = this.idGiamGia;
    data['ten_sp'] = this.tenSp;
    data['size'] = this.size;
    // data['note'] = this.note;
    return data;
  }
}
