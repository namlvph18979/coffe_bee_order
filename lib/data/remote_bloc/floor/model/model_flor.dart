class ModelFloor {
  String? id;
  String? name;

  ModelFloor({
    this.id,
    this.name,
  });

  ModelFloor.fromJson(dynamic json) {
    id = json['id_tang'];
    name = json['soTang'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_tang'] = id;
    map['soTang'] = name;
    return map;
  }

}