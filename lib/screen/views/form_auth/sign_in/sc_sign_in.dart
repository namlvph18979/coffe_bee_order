import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/views/form_auth/forgot_password.dart';
import 'package:coffe_bee_order/screen/views/home/sc_home.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:coffe_bee_order/screen/widgets/item_input.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/image_path.dart';

class ScreenSignIn extends StatefulWidget {

  String title;

  ScreenSignIn(this.title);

  @override
  State<ScreenSignIn> createState() => _ScreenSignInState();
}

class _ScreenSignInState extends State<ScreenSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
          title: "đăng nhập".toUpperCase()),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.height,
            Align(
              alignment: Alignment.center,
              child: Image.asset(ImagePath.logo,height: 180)),
            20.height,
            Text(widget.title,style: StyleApp.style700.copyWith(fontSize: 20),
                textAlign: TextAlign.left),
            15.height,
            itemInputText(
              hint: "Vui lòng nhập",
              labeltext: "Tên đăng nhập",
              type: TextFieldType.USERNAME,
            ),
            20.height,
            itemInputText(
              hint: "Vui lòng nhập",
              labeltext: "Mật khẩu",
              type: TextFieldType.PASSWORD,
            ),
            12.height,
            Text(
              "Quên mật khẩu?",
              style: StyleApp.style400.copyWith(
                  color: Colors.blue),).onTap((){
                     ScreenForgotPass(title: "quên mật khẩu",).launch(context);
            }),
            25.height,
            itemButton(textBtn: "Đăng nhập".toUpperCase()).onTap((){
              if(widget.title == "Pha Chế"){
                ScreenHome(isPhache: true).launch(context,isNewTask: true);
              }else{
                ScreenHome(isPhache: false).launch(context,isNewTask: true);
              }

            })
          ],
      ).paddingSymmetric(horizontal: 10,vertical: 15).scrollView()
    );
  }
}
