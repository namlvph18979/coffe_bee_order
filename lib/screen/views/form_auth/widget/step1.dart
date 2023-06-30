import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:coffe_bee_order/screen/widgets/item_input.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ItemStep1 extends StatelessWidget {

  Function() ontap;


  ItemStep1({required this.ontap});

  @override
  Widget build(BuildContext context) {

    final phone = TextEditingController();
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
            type: TextFieldType.PHONE,
            hint: "Vui lòng nhập...",
            labeltext: "Số điện thoại",
            controller: phone,
          ),
          20.height,
          itemButton(
              textBtn: "Tiếp tục",
              width: MediaQuery.of(context).size.width,
              onPress: ontap,
          ).scrollView()
        ],
    );
  }
}
