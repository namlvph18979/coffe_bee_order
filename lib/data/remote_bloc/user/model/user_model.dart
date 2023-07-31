class UserModel {

  String? idUser;
  String? userName;
  String? image;
  String? passwd;
  String? phoneNumber;
  String? chucNang;
  String? fullName;

  UserModel({
    this.idUser,
    this.userName,
    this.image,
    this.passwd,
    this.phoneNumber,
    this.chucNang,
    this.fullName,});

  UserModel.fromJson(dynamic json) {
    idUser = json['Id_User'];
    userName = json['userName'];
    image = json['image'];
    passwd = json['passwd'];
    phoneNumber = json['phone_Number'];
    chucNang = json['chucNang'];
    fullName = json['fullName'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id_User'] = idUser;
    map['userName'] = userName;
    map['image'] = image;
    map['passwd'] = passwd;
    map['phone_Number'] = phoneNumber;
    map['chucNang'] = chucNang;
    map['fullName'] = fullName;
    return map;
  }

}