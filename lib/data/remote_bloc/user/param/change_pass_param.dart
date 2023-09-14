class ChangePassParam {
  String? id;
  String? pass;
  String? newPasswd;

  ChangePassParam({
    this.id,
    this.pass,
    this.newPasswd
  });

  Map<String, dynamic> toMap() {
      return {
        'id_user': this.id,
        'passwd': this.pass,
        'newPasswd': this.newPasswd
      };
  }
}
