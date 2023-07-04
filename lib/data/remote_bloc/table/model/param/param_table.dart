class paramTable{
    String? id;
    int? idFloor;
    String? name;
    bool? isActive;

    paramTable({
      this.id,
      this.idFloor,
      this.name,
      this.isActive
    });

    Map<String, dynamic> toJson() {
      final map = <String, dynamic>{};
      map['isActive'] = isActive;
      map['name'] = name;
      map['id'] = id;
      map['idFloor'] = idFloor;
      return map;
    }
}
