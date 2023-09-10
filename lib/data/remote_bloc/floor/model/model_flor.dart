class ModelFloor {
  String? idTang;
  String? soTang;

  ModelFloor({this.idTang, this.soTang});

  ModelFloor.fromJson(Map<String, dynamic> json) {
    idTang = json['id_tang'];
    soTang = json['soTang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_tang'] = this.idTang;
    data['soTang'] = this.soTang;
    return data;
  }
}
