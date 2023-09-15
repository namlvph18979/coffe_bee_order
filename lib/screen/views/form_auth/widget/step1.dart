import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:coffe_bee_order/screen/widgets/item_input.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ItemStep1 extends StatefulWidget {

  Function() ontap;

  ItemStep1({
    required this.ontap,});

  @override
  State<ItemStep1> createState() => _ItemStep1State();
}

class _ItemStep1State extends State<ItemStep1> {
  final passOdl = TextEditingController();
  final passNew = TextEditingController();
  final enterAPassNew =  TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.height,
          Text("Xác thực tài khoản",style: StyleApp.style700.copyWith(color: Colors.black,fontSize: 16),),
          15.height,
          Text("Vui lòng nhập số điện thoại đã đăng ký để xác thực định danh người dùng",
            style: StyleApp.style400.copyWith(color: Colors.black),),
          25.height,
          itemInputText(
            type: TextFieldType.PASSWORD,
            hint: "Vui lòng nhập...",
            labeltext: "Mật khẩu cũ",
            controller: passOdl,
          ),
          SizedBox(height: 10,),
          itemInputText(
            type: TextFieldType.PASSWORD,
            hint: "Vui lòng nhập...",
            labeltext: "Mật khẩu mới",
            controller: passNew,
          ),
          SizedBox(height: 10,),
          itemInputText(
            type: TextFieldType.PASSWORD,
            hint: "Vui lòng ...",
            labeltext: "Nhập lại mật khẩu mới",
            controller: enterAPassNew,
          ),
          20.height,
          itemButton(
              textBtn: "Đổi mật khẩu",
              width: MediaQuery.of(context).size.width,
              onPress: widget.ontap,
          ).scrollView()
        ],
    );
  }
}
