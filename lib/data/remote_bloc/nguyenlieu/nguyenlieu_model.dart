class ModelNL {

  String? idNguyenLieu;
  String? soLuong;
  String? price;
  String? idUser;
  String? tenNguyenLieu;

  ModelNL({
    this.idNguyenLieu,
    this.soLuong,
    this.price,
    this.idUser,
    this.tenNguyenLieu,});

  ModelNL.fromJson(dynamic json) {
    idNguyenLieu = json['Id_nguyenLieu'];
    soLuong = json['soLuong'];
    price = json['price'];
    idUser = json['id_User'];
    tenNguyenLieu = json['ten_nguyenLieu'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id_nguyenLieu'] = idNguyenLieu;
    map['soLuong'] = soLuong;
    map['price'] = price;
    map['id_User'] = idUser;
    map['ten_nguyenLieu'] = tenNguyenLieu;
    return map;
  }

}