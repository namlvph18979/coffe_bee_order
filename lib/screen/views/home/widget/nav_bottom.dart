import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/local_bloc/navbloc.dart';
import 'package:coffe_bee_order/screen/views/add_order/sc_create_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';

class BottomNav extends StatelessWidget {

  bool isPhaChe;
  BottomNav({required this.isPhaChe});

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).padding.bottom;
    return Container(
        height: 80 + padding,
        padding: EdgeInsets.only(bottom: padding),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius:const BorderRadius.vertical(top: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: ColorApp.text.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 3
            ),
          ]
        ),
      child: isPhaChe
        ? Row(
        children: [
          ItemNav(icon: Icons.chat, title: "Đơn hàng",index: 0),
          ItemNav(icon: Icons.chat, title: "Nguyên liệu",index: 1),
          ItemNav(icon: Icons.account_circle, title: "Tài khoản",index: 2),
        ])
        : Row(
            children: [
                ItemNav(icon: Icons.home, title: "Trang chủ",index: 0),
                ItemNav(icon: Icons.article, title: "Hóa đơn", index: 1),
                ItemNavAdd(context),
                ItemNav(icon: Icons.chat, title: "Đơn hàng",index: 2),
                ItemNav(icon: Icons.account_circle, title: "Tài khoản",index: 3),

            ],
      ),
    );
  }

  Widget ItemNav({
    required IconData icon,
    required String title,
    int index = 0
}){
    return Expanded(
        child: BlocBuilder<NavBloc,int>(
          builder: (context, state) {
              return InkWell(
                onTap: () => context.read<NavBloc>().change(index),
                child: Column(
                  children: [
                      Icon(
                        icon,
                        color: state == index ? ColorApp.text : Colors.grey,
                      ),
                      Text(title,
                        style: StyleApp.style400.copyWith(
                          fontSize: 12,
                          color: state == index ? ColorApp.text : Colors.grey
                        ),)
                  ],
                ).paddingSymmetric(vertical: 15,horizontal: 5),
              );
          },

        ));
  }

  Widget ItemNavAdd(BuildContext context){
    return Expanded(
        child: InkWell(
          onTap: () {
            ScreenCreateOrder().ShowBottomSheet(context);
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: ColorApp.text,
              shape: BoxShape.circle,
               boxShadow: [
                  BoxShadow(
                      color: ColorApp.text.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 5
                  ),
                ]
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add,
                    color:  Colors.white,
                    size: 25,
                  ),
                  Text("Tạo đơn",
                    style: StyleApp.style400.copyWith(
                        fontSize: 12,
                        color: Colors.white
                    ),)
                ]
            ),
          ),
        ));
  }
}
