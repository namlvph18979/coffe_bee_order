class modeltable{
  int? id;
  String? name;
  bool isActive;

  modeltable({
    required this.id,
    required this.name,
    this.isActive = false});
}