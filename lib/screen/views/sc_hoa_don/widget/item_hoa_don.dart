import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';

class ItemHoaDon extends StatelessWidget {
  ModelInvoice model;
  Function()? ontap1;
  Function()? ontap2;
  Function()? ontap3;
  Function()? ontap4;
  bool? isdonhang;

  ItemHoaDon({
    required this.model,
    this.isdonhang = false,
    this.ontap1,
    this.ontap2,
    this.ontap3,
    this.ontap4
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin:const EdgeInsets.all(10),
      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: ColorApp.text,width: 1)
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bàn số: ${model.idTable} - Tầng: ${model.idfloor}",style: StyleApp.style700.copyWith(fontSize: 18),),
              5.height,
              Text("Tổng bill: ${model.price}đ",style: StyleApp.style500.copyWith(color: Colors.red,fontSize: 12),),
              5.height,
              model.type != 0
                  ? Text("Trạng thái: Đã thanh toán",style: StyleApp.style500.copyWith(color: Colors.red,fontSize: 12),)
                  : Text("Trạng thái: Chưa thanh toán",style: StyleApp.style500.copyWith(color: Colors.red,fontSize: 12),),
              5.height,
              Text("Nv phụ trách: ${model.user!.userName}",style: StyleApp.style500.copyWith(color: Colors.red,fontSize: 12),),
              const Spacer(),
              Text("Giờ vào: ${model.timeIn}",style: StyleApp.style400.copyWith(fontSize: 11),),
            ],
          ).expand(flex: 4),
          const Spacer(),
          isdonhang!
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              model.type  != 0
                  ? const SizedBox()
                  : Container(
                    height: 30,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorApp.text,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Text(
                      "Thanh toán",
                      style: StyleApp.style600.copyWith(color: Colors.white,fontSize: 12),)
                ).onTap(ontap1),
              15.height,
              Container(
                height: 30,
                width: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorApp.text,
                    borderRadius: BorderRadius.circular(5)
                ),
                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child:Text(
                  "Đóng bàn",
                  style: StyleApp.style600.copyWith(color: Colors.white,fontSize: 12),),
              ).onTap(ontap2)
            ],
          ).expand(flex: 2)
              : Align(
                    alignment: Alignment.bottomCenter,
                    child: !model.isDone!
                        ? AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    pause:const Duration(milliseconds: 100),
                    animatedTexts: [
                      WavyAnimatedText("Đơn đang xử lý...",
                          textStyle: StyleApp.style500.copyWith(fontSize: 12))
                    ])
                        : Container(
                            height: 30,
                            width: 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorApp.text,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            child: Text(
                              "Nhận đơn",
                              style: StyleApp.style600.copyWith(color: Colors.white,fontSize: 12),)
                    ).onTap(ontap4)
                )
                

        ],
      ),
    ).onTap(ontap3);
  }
}
