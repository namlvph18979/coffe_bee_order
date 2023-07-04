class ModelFloor {
  String? id;
  String? name;

  ModelFloor({
    this.id,
    this.name,
  });

  ModelFloor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}