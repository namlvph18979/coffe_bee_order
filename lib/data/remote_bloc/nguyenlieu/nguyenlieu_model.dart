class ModelNL{
  int? id;
  String? imgUrl;
  String? name;
  int? soluong;
  String? type;
  int? price;

  ModelNL({
    required this.id,
    this.imgUrl,
    required this.name,
    this.soluong,
    required this.type,
    this.price
  });
}