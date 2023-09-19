import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/param/change_param.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/user_bloc.dart';
import 'package:coffe_bee_order/screen/widgets/custom_button.dart';
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
  final passOdl = TextEditingController();
  final passNew = TextEditingController();
  final enterAPassNew = TextEditingController();
  final bloc = userbloc();
  UserModel user = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var res = getJSONAsync(DBKeyLocal.user);
    if (res != null) {
      user = UserModel.fromJson(res);
    }
    print("###################" + res.toString());
  }
  ChangePass() {
      bloc.changePass(ChangeParam(
          id_user: user.Id_User.toString(),
          passwd: passOdl.text,
          newPasswd: passNew.text,
      )
      );
  }
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
            validator: (p0) {
              return ValidatorApp.checkPass(text: p0);
            },
          ),
          SizedBox(height: 10,),
          itemInputText(
            type: TextFieldType.PASSWORD,
            hint: "Vui lòng nhập...",
            labeltext: "Mật khẩu mới",
            controller: passNew,
            validator: (p0) {
              return ValidatorApp.checkPass(text: p0);
            },
          ),
          SizedBox(height: 10,),
          itemInputText(
            type: TextFieldType.PASSWORD,
            hint: "Vui lòng ...",
            labeltext: "Nhập lại mật khẩu mới",
            controller: enterAPassNew,
            validator: (p0) {
              return ValidatorApp.checkPass(text: p0);
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
                },
                failure: () {
                  toast("Sai tên tài khoản hoặc mật khẩu");
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
    );
  }
}
