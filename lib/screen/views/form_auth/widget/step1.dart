import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/model/user_model.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/param/change_pass_param.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/user_bloc.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:coffe_bee_order/screen/widgets/item_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/db/db_key_local.dart';
import '../../../../config/style_app/validator.dart';
import '../../../../data/check_state.dart';
import '../../../../data/enum/blocstatus.dart';

class ItemStep1 extends StatefulWidget {

  Function()? ontap;

  ItemStep1({
    this.ontap,});

  @override
  State<ItemStep1> createState() => _ItemStep1State();
}

class _ItemStep1State extends State<ItemStep1> {
  final bloc = userbloc();
  final passOdl = TextEditingController();
  final passNew = TextEditingController();
  final enterAPassNew = TextEditingController();
  UserModel userModel = UserModel();

  @override
  void initState() {
    var res = getJSONAsync(DBKeyLocal.user);
    userModel = UserModel.fromJson(res);
    print("###################" + res.toString());
    super.initState();
  }


  changePass(){
    bloc.changePass(
      ChangePassParam(
        id: userModel.Id_User.toString(),
        pass: passOdl.text,
        newPasswd: passNew.text
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<userbloc, CubitState>(
      bloc: bloc,
      listener: (context, state) {
        CheckStateBloc.checkNoLoad(context, state, success: () => finish(context),);
      },
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.height,
          Text("Xác thực tài khoản",style: StyleApp.style700.copyWith(color: Colors.black,fontSize: 16),),
          15.height,
          Text("Vui lòng nhập số điện thoại đã đăng ký để xác thực định danh người dùng",
            style: StyleApp.style400.copyWith(color: Colors.black),),
          SizedBox(height: 10,),
          itemInputText(
            type: TextFieldType.PASSWORD,
            hint: "Vui lòng nhập...",
            labeltext: "Mật khẩu cũ",
            controller: passOdl,
            validator: (val) {
              return ValidatorApp.checkPass(
                  text: val, text2: passOdl.text, isSign: true);
            },
          ),
          SizedBox(height: 10,),
          itemInputText(
            type: TextFieldType.PASSWORD,
            hint: "Vui lòng nhập...",
            labeltext: "Mật khẩu mới",
            controller: passNew,
            validator: (val) {
              return ValidatorApp.checkPass(
                  text: val, text2: passNew.text, isSign: true);
            },
          ),
          SizedBox(height: 10,),
          itemInputText(
            type: TextFieldType.PASSWORD,
            hint: "Vui lòng nhập lại...",
            labeltext: "Mật khẩu mới",
            controller: enterAPassNew,
            validator: (val) {
              return ValidatorApp.checkPass(
                  text: val, text2: enterAPassNew.text, isSign: true);
            },
          ),
          20.height,
          itemButton(
            textBtn: "Tiếp tục",
            width: MediaQuery.of(context).size.width,
            onPress: changePass,
            // isLoad: state.status == BlocStatus.loading,
          ).scrollView()
        ],
      ),
    );
  }
}
