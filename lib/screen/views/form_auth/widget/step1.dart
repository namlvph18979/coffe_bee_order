import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/param/change_param.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/user_bloc.dart';
import 'package:coffe_bee_order/screen/widgets/custom_button.dart';
import 'package:coffe_bee_order/screen/widgets/input_text.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:coffe_bee_order/screen/widgets/item_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/db/db_key_local.dart';
import '../../../../config/style_app/validator.dart';
import '../../../../data/check_state.dart';
import '../../../../data/cubit_state.dart';
import '../../../../data/enum/blocstatus.dart';
import '../../../../data/remote_bloc/user/model/user_model.dart';

class ItemStep1 extends StatefulWidget {
  ItemStep1({super.key});

  @override
  State<ItemStep1> createState() => _ItemStep1State();
}

class _ItemStep1State extends State<ItemStep1> {
  final pass = TextEditingController();
  final pass_new = TextEditingController();
  final re_pass_new = TextEditingController();
  final bloc = userbloc();
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  ChangePass() {
    if(_keyForm.currentState!.validate()){
      bloc.changePass(pass: pass_new.text,passold: pass.text);
    }else{
      toast("Thông tin không chính xác");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.height,
            Text("Xác thực tài khoản",style: StyleApp.style700.copyWith(color: Colors.black,fontSize: 16),),
            15.height,
            Text("Vui lòng nhập đầy đủ thông tin để thay đổi thông tin tài khoản!",
              style: StyleApp.style400.copyWith(color: Colors.black),),
            25.height,
            InputText(
              textFieldType: TextFieldType.PASSWORD,
              hintText: "Vui lòng nhập...",
              label: "Mật khẩu cũ",
              controller: pass,
              validator: (p0) {
                return ValidatorApp.checkNull(text: p0,isTextFiled: true);
              },
            ),
            SizedBox(height: 10,),
            InputText(
              textFieldType: TextFieldType.PASSWORD,
              hintText: "Vui lòng nhập...",
              label: "Mật khẩu mới",
              controller: pass_new,
              validator: (p0) {
                return ValidatorApp.checkNull(text: p0,isTextFiled: true);
              },
            ),
            SizedBox(height: 10,),
            InputText(
              textFieldType: TextFieldType.PASSWORD,
              hintText: "Vui lòng ...",
              label: "Nhập lại mật khẩu mới",
              controller: re_pass_new,
              validator: (p0) {
                return ValidatorApp.checkPass(text: p0,text2: pass_new.text);
              },
            ),
            20.height,
            BlocConsumer<userbloc, CubitState>(
              bloc: bloc,
              listener: (context, state) {
                CheckStateBloc.checkNoLoad(
                  context,
                  state,
                  msg: state.msg,
                  isShowMsg: true,
                  success: () {
                    toast("Đổi mật khẩu thành công");
                  },
                );
              },
              builder: (context, state) {
                return CustomButton(
                    title: "Đổi mật khẩu",
                    isLoad: state.status == BlocStatus.loading,
                    color: ColorApp.text,
                    onTap: ChangePass,
                    textColor: Colors.white
                ).withWidth(MediaQuery.of(context).size.width);
                return Container();
              },
            )
          ],
      ),
    );
  }
}
