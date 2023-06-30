import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/widgets/item_input.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../widgets/item_button.dart';

class ItemStep3 extends StatelessWidget {
  Function()? onTap;

  ItemStep3({this.onTap});

  @override
  Widget build(BuildContext context) {

    final passOld = TextEditingController();
    final passNew = TextEditingController();
    final passReNew = TextEditingController();
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.height,
        Text("Thay đổi mật khẩu",
          style: StyleApp.style700.copyWith(color: Colors.black,fontSize: 16),),
        15.height,
        itemInputText(
          controller: passOld,
          labeltext: "Mật khẩu cũ",
          hint: "Vui lòng nhập",
          type: TextFieldType.PASSWORD,
        ),
        15.height,
        itemInputText(
          controller: passNew,
          labeltext: "Mật khẩu mới",
          hint: "Vui lòng nhập",
          type: TextFieldType.PASSWORD,
        ),
        15.height,
        itemInputText(
          controller: passReNew,
          labeltext: "Nhập lại Mật khẩu mới",
          hint: "Vui lòng nhập",
          type: TextFieldType.PASSWORD,
        ),
        20.height,
        itemButton(
          textBtn: "Xác Nhận",
          width: MediaQuery.of(context).size.width,
          onPress: onTap,
        ),
      ],
    ).scrollView();
  }
}
