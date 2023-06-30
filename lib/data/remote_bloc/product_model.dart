class ModelPro{
  int id;
  int idCat;
  String name;
  String imageUrl;
  int price;
  int soluong;
  String? description;
  String? note;
  int? discountPercent;

  ModelPro({
    required this.id,
    required this.idCat,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.soluong = 1,
    this.description,
    this.note,
    this.discountPercent,
  });
}