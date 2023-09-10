class UserModel {
  int? Id_User;
  String? userName;
  String? image;
  String? passwd;
  String? phone_Number;
  String? chucNang;
  String? fullName;


  UserModel({
     this.Id_User,
     this.userName,
     this.image,
     this.passwd,
     this.phone_Number,
     this.chucNang,
     this.fullName

  });

  UserModel.fromJson(dynamic json) {
    Id_User = json['Id_User'];
    userName = json['userName'];
    image = json['image'];
    passwd = json['passwd'];
    phone_Number = json['phone_Number'];
    chucNang = json['chucNang'];
    fullName = json['fullName'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id_User'] = Id_User;
    map['userName'] = userName;
    map['image'] = image;
    map['passwd'] = passwd;
    map['phone_Number'] = phone_Number;
    map['chucNang'] = chucNang;
    map['fullName'] = fullName;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'Id_User': this.Id_User,
      'userName': this.userName,
      'image': this.image,
      'passwd': this.passwd,
      'phone_Number': this.phone_Number,
      'chucNang': this.chucNang,
      'fullName': this.fullName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      Id_User: map['Id_User'] as int,
      userName: map['userName'] as String,
      image: map['image'] as String,
      passwd: map['passwd'] as String,
      phone_Number: map['phone_Number'] as String,
      chucNang: map['chucNang'] as String,
      fullName: map['fullName'] as String,
    );
  }
}
