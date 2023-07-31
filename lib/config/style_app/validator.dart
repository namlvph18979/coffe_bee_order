class ValidatorApp {
  static checkNull({
    String? text,
    bool isTextFiled = false,
    bool isCheck = true,
  }) {
    if (text == "null" || text == null || text == "") {
      if (!isCheck) {
        return null;
      }
      return isTextFiled ? "Không bỏ trống" : "Đang cập nhật";
    } else {
      return isTextFiled ? null : text;
    }
  }

  static checkPass({
    String? text,
    String? text2,
    bool isSign = false,
    bool isCheck = true,
  }) {
    // RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
    if (text == "null" || text == "" || text == null) {
      if (!isCheck) {
        return null;
      }
      return "Không bỏ trống";
    } else if (text.length < 6) {
      // return "Mật khẩu phải chứa chữ cái viết hoa, thường số và lớn hơn 6 ký tự";
      return "Mật khẩu phải lớn hơn 6 ký tự";
    } else if (text != text2 && isSign) {
      return "Mật khẩu không khớp";
    } else {
      return null;
    }
  }

  static checkPhone({
    String? text,
    String? msg,
    bool isCheck = true,
  }) {
    try {
      if (text == "null" || text == null || text == "") {
        if (!isCheck) {
          return null;
        }
        return msg ?? "Không bỏ trống";
      }
      int.parse(text);
      if (text.length != 10 || !text.startsWith("0")) {
        return "Số điện thoại không đúng định dạng";
      } else {
        return null;
      }
    } catch (e) {
      return "Số điện thoại không đúng định dạng";
    }
  }

  static checkEmail({
    String? text,
    bool isCheck = true,
  }) {
    var isEmail = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (text == "null" || text == null || text == "") {
      if (!isCheck) {
        return null;
      }
      return "Không bỏ trống";
    } else if (!isEmail.hasMatch(text)) {
      return "Email không đúng định dạng";
    } else {
      return null;
    }
  }
}
