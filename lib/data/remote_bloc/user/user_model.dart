class UserModel{
  int? id;
  String? userName;
  String? avatar;
  String? passWord;
  String? phoneNumber;
  int? Type;

  UserModel({
    required this.id,
    required this.userName,
    this.avatar,
    required this.passWord,
    required this.phoneNumber,
    required this.Type});

}