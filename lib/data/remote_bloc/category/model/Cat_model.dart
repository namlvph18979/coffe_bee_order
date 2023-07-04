class ModelCat {
  String? name;
  int? id;

  ModelCat({
      this.name, 
      this.id
  });

  ModelCat.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    return map;
  }

}