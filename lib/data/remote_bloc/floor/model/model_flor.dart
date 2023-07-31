class FloorModel {
  String? idTang;
  String? soTang;

  FloorModel({this.idTang, this.soTang});

  FloorModel.fromJson(Map<String, dynamic> json) {
    idTang = json['id_tang'];
    soTang = json['soTang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_tang'] = idTang;
    data['soTang'] = soTang;
    return data;
  }
}
