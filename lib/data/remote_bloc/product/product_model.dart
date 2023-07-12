class ModelPro{
  int? id;
  int? idCat;
  String? name;
  String? imageUrl;
  int? price;
  int? soluong;
  String? description;
  String? note;
  int? discountPercent;

  ModelPro({
    this.id,
    this.idCat,
    this.name,
    this.imageUrl,
    this.price,
    this.soluong = 1,
    this.description,
    this.note,
    this.discountPercent,
  });

  ModelPro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCat = json['idCat'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    soluong = json['soluong'];
    description = json['description'];
    note = json['note'];
    discountPercent = json['discountPercent'];
  }
}