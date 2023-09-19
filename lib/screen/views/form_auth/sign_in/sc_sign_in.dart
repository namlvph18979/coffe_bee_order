import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/config/style_app/validator.dart';
import 'package:coffe_bee_order/data/check_state.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/model/user_model.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/param/login_param.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/user_bloc.dart';
import 'package:coffe_bee_order/screen/views/form_auth/forgot_password/forgot_password.dart';
import 'package:coffe_bee_order/screen/views/home/sc_home.dart';
import 'package:coffe_bee_order/screen/widgets/custom_button.dart';
import 'package:coffe_bee_order/screen/widgets/input_text.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/image_path.dart';

class ScreenSignIn extends StatefulWidget {

  String type;

  ScreenSignIn(this.type);

  @override
  State<ScreenSignIn> createState() => _ScreenSignInState();
}

class _ScreenSignInState extends State<ScreenSignIn> {
  final bloc = userbloc();
  final _keyForm = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();

  Login() {
    if (_keyForm.currentState!.validate()) {
      bloc.login(LoginParam(username: username.text, pass: password.text),type: widget.type);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: itemAppBar(title: "đăng nhập".toUpperCase()),
        body: Form(
          key: _keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.height,
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(ImagePath.logo, height: 180)),
              20.height,
              // Text(widget.title,style: StyleApp.style700.copyWith(fontSize: 20),
              //     textAlign: TextAlign.left),
              15.height,
              InputText(
                hintText: "Username",
                textFieldType: TextFieldType.USERNAME,
                controller: username,
                validator: (p0) {
                  return ValidatorApp.checkNull(text: p0, isTextFiled: true);
                },
              ),
              20.height,
              InputText(
                hintText: "Password",
                textFieldType: TextFieldType.PASSWORD,
                controller: password,
                validator: (p0) {
                  return ValidatorApp.checkNull(text: p0,isTextFiled: true);
                },
              ),
              12.height,
              Text(
                "Quên mật khẩu?",
                style: StyleApp.style400.copyWith(color: Colors.blue),
              ).onTap(() {
                ScreenForgotPass(
                  title: "quên mật khẩu",
                ).launch(context);
              }),
              15.height,
              BlocConsumer<userbloc, CubitState>(
                bloc: bloc,
                listener: (context, state) {
                  CheckStateBloc.checkNoLoad(
                    context,
                    state,
                    msg: state.msg,
                    isShowMsg: true,
                    success: () {
                      ScreenHome(
                        isPhache: widget.type != "3" ? false : true ,
                      ).launch(context,isNewTask: true);
                    },
                    failure: () {
                      toast("Sai tên tài khoản hoặc mật khẩu");
                    },
                  );
                },
                builder: (context, state) {
                  return CustomButton(
                      title: "Đăng Nhâp",
                      isLoad: state.status == BlocStatus.loading,
                      color: ColorApp.text,
                      onTap: Login,
                      textColor: Colors.white
                  ).withWidth(MediaQuery.of(context).size.width);
                  return Container();
                },
              )
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 15).scrollView(),
        ));
  }
}
