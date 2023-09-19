class ChangeParam {
  String? id_user;
  String? passwd;
  String? newPasswd;

  ChangeParam({
    this.id_user,
    this.passwd,
    this.newPasswd
  });

  Map<String, dynamic> toMap() {
    return {
      'id_user': this.id_user,
      'passwd': this.passwd,
      'newPasswd': this.newPasswd,
    };
  }

  factory ChangeParam.fromMap(Map<String, dynamic> map) {
    return ChangeParam(
      id_user: map['id_user'] as String,
      passwd: map['passwd'] as String,
      newPasswd: map['newPasswd'] as String,
    );
  }
}