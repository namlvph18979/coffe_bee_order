
class ModelInvoice {
  String? idHoaDonCT;
  String? timeData;
  String? tongTien;
  String? trangThai;
  String? idGiamGia;
  String? timeIn;
  String? timeOut;
  String? fullname;
  String? idTable;
  List<HoadonItems>? hoadonItems;


  ModelInvoice({
    this.idHoaDonCT,
    this.timeData,
    this.tongTien,
    this.trangThai,
    this.idGiamGia,
    this.timeIn,
    this.timeOut,
    this.fullname,
    this.idTable,
    this.hoadonItems,});

  ModelInvoice.fromJson(dynamic json) {
    idHoaDonCT = json['Id_hoaDonCT'];
    timeData = json['time_Data'];
    tongTien = json['tongTien'];
    trangThai = json['trangThai'];
    idGiamGia = json['id_giamGia'];
    timeIn = json['time_in'];
    timeOut = json['time_out'];
    fullname = json['fullName'];
    idTable = json['Id_Table'];
    if (json['hoadon_items'] != null) {
      hoadonItems = [];
      json['hoadon_items'].forEach((v) {
        hoadonItems?.add(HoadonItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id_hoaDonCT'] = idHoaDonCT;
    map['time_Data'] = timeData;
    map['tongTien'] = tongTien;
    map['trangThai'] = trangThai;
    map['id_giamGia'] = idGiamGia;
    map['time_in'] = timeIn;
    map['time_out'] = timeOut;
    map['fullName'] = fullname;
    map['Id_Table'] = idTable;
    if (hoadonItems != null) {
      map['hoadon_items'] = hoadonItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class HoadonItems {
  String? idHdItem;
  String? idSanPham;
  String? soLuong;
  String? giaSp;
  String? tenSp;
  String? idHoaDonCT;

  HoadonItems({
    this.idHdItem,
    this.idSanPham,
    this.soLuong,
    this.giaSp,
    this.tenSp,
    this.idHoaDonCT,});

  HoadonItems.fromJson(dynamic json) {
    idHdItem = json['id_hd_item'];
    idSanPham = json['id_sanPham'];
    soLuong = json['soLuong'];
    giaSp = json['giaSp'];
    tenSp = json['tenSp'];
    idHoaDonCT = json['Id_hoaDonCT'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_hd_item'] = idHdItem;
    map['id_sanPham'] = idSanPham;
    map['soLuong'] = soLuong;
    map['giaSp'] = giaSp;
    map['tenSp'] = tenSp;
    map['Id_hoaDonCT'] = idHoaDonCT;
    return map;
  }

}

class HoadonItemsAdd {
  String? idSanPham;
  String? soLuong;
  String? giaSp;
  String? tenSp;

  HoadonItemsAdd({
    this.idSanPham,
    this.soLuong,
    this.giaSp,
    this.tenSp,
    });

  HoadonItemsAdd.fromJson(dynamic json) {
    idSanPham = json['id_sanPham'];
    soLuong = json['soLuong'];
    giaSp = json['giaSp'];
    tenSp = json['tenSp'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_sanPham'] = idSanPham;
    map['soLuong'] = soLuong;
    map['giaSp'] = giaSp;
    map['tenSp'] = tenSp;
    return map;
  }

}