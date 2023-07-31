import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/config/style_app/validator.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/user_bloc.dart';
import 'package:coffe_bee_order/screen/views/form_auth/forgot_password/forgot_password.dart';
import 'package:coffe_bee_order/screen/views/home/sc_home.dart';
import 'package:coffe_bee_order/screen/widgets/input_text.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
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

  final bloc = userbloc();
  final _keyForm = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();


  Login(){
      if(_keyForm.currentState!.validate()){
          bloc.Login(
              username: username.text,
              pass: password.text,
              type: widget.title,
              context: context
          );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
          title: "đăng nhập".toUpperCase()),
      body: Form(
        key: _keyForm,
        child: Column(
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
              InputText(
                hintText: "Username",
                textFieldType: TextFieldType.USERNAME,
                controller: username,
                validator: (p0) {
                  return ValidatorApp.checkNull(text: p0,isTextFiled: true);
                },
              ),
              20.height,
              InputText(
                hintText: "Password",
                textFieldType: TextFieldType.PASSWORD,
                controller: password,
                validator: (p0) {
                  return ValidatorApp.checkPass(text: p0);
                },
              ),
              12.height,
              Text(
                "Quên mật khẩu?",
                style: StyleApp.style400.copyWith(
                    color: Colors.blue),).onTap((){
                       ScreenForgotPass(title: "quên mật khẩu",).launch(context);
              }),
              30.height,
              itemButton(
                  textBtn: "Đăng nhập".toUpperCase(),
                  margin: 0,
                onPress: Login,
              )
            ],
        ).paddingSymmetric(horizontal: 10,vertical: 15).scrollView(),
      )
    );
  }
}
