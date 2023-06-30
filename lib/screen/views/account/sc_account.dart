import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/user_model.dart';
import 'package:coffe_bee_order/screen/views/account/sc_update_infor.dart';
import 'package:coffe_bee_order/screen/views/account/widget/image_banner.dart';
import 'package:coffe_bee_order/screen/views/form_auth/forgot_password.dart';
import 'package:coffe_bee_order/screen/views/form_auth/sc_start.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config/style_app/color_app.dart';
import '../../../config/style_app/style_text.dart';

class ScreenAccount extends StatefulWidget {

  @override
  State<ScreenAccount> createState() => _ScreenAccountState();
}

class _ScreenAccountState extends State<ScreenAccount> {

  UserModel FakeUser = UserModel(
      id: 1,
      avatar: "https://i.pinimg.com/236x/a9/e6/85/a9e685315c3761f64bf490264c3e1421.jpg",
      userName: "anh da đen với cái quần đùi vàng",
      passWord: "0123456789",
      phoneNumber: "1900 0091",
      Type: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
          title: "thông tin cá nhân",
          align: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImagebannerUser(model: FakeUser),
          15.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Họ Tên: ${FakeUser.userName}",
                style: StyleApp.style400.copyWith(color: Colors.black,
                    overflow: TextOverflow.ellipsis),maxLines: 2),
                10.height,
                Text("Số điện thoại: ${FakeUser.phoneNumber}",
                  style: StyleApp.style400.copyWith(color: Colors.black),),
                10.height,
                Text("Mật khẩu: ************",
                  style: StyleApp.style400.copyWith(color: Colors.black,),),
                10.height,
                Text("Nghiệp vụ: Nhân viên bàn",
                  style: StyleApp.style400.copyWith(color: Colors.black),)
            ],
          ).paddingAll(10),
          15.height,
          Container(
            height: 300,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey,width: 0.5)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemCase(
                    icon: Icons.settings, 
                    text: "Cập nhật thông tin"
                ).onTap((){
                  ScreenUpdateInfor(model: FakeUser).launch(context);
                }),
                
                const Divider(color: Colors.grey,thickness: 0.5),
                itemCase(
                    icon: Icons.change_circle_sharp, 
                    text: "Đổi mật khẩu"
                ).onTap((){
                  ScreenForgotPass(title: "Đổi mật khẩu").launch(context);
                }),
                
                const Divider(color: Colors.grey,thickness: 0.5),
                itemCase(
                    icon: Icons.logout_sharp, 
                    text: "Đăng xuất"
                ).onTap((){
                  const ScreenStart().launch(context,isNewTask: true);
                }),
              ],
            ),
          )
        ],
      ).scrollView(),
    );
  }

  Widget itemCase({IconData? icon, String? text}){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration:const BoxDecoration(
            color: ColorApp.bg,
            shape: BoxShape.circle
          ),
          child: Icon(icon,color: ColorApp.text),
        ),
        15.width,
        Text(text!,style: StyleApp.style500.copyWith(color: Colors.black),)
      ],
    );
  }
}
