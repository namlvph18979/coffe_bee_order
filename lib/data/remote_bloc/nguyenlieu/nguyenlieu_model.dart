class ModelNL {

  String? idNguyenLieu;
  String? soLuong;
  String? price;
  String? idUser;
  String? tenNguyenLieu;
  String? imgNguyenLieu;
  String? kieuNguyenLieu;

  ModelNL({
    this.idNguyenLieu,
    this.soLuong,
    this.price,
    this.idUser,
    this.tenNguyenLieu,
    this.imgNguyenLieu,
    this.kieuNguyenLieu,});

  ModelNL.fromJson(dynamic json) {
    idNguyenLieu = json['Id_nguyenLieu'];
    soLuong = json['soLuong'];
    price = json['price'];
    idUser = json['id_User'];
    tenNguyenLieu = json['ten_nguyenLieu'];
    imgNguyenLieu = json['img_nguyenLieu'].substring(2) as String;
    kieuNguyenLieu = json['kieuNguyenLieu'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id_nguyenLieu'] = idNguyenLieu;
    map['soLuong'] = soLuong;
    map['price'] = price;
    map['id_User'] = idUser;
    map['ten_nguyenLieu'] = tenNguyenLieu;
    map['img_nguyenLieu'] = imgNguyenLieu;
    map['kieuNguyenLieu'] = kieuNguyenLieu;
    return map;
  }

}