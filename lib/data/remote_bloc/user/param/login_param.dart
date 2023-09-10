class LoginParam {
  String username;
  String pass;

  LoginParam({
    required this.username,
    required this.pass,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': this.username,
      'passwd': this.pass,
    };
  }

  factory LoginParam.fromMap(Map<String, dynamic> map) {
    return LoginParam(
      username: map['userName'] as String,
      pass: map['passwd'] as String,
    );
  }
}