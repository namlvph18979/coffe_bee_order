import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';

class ItemHoaDon extends StatelessWidget {
  ModelInvoice model;
  Function()? closeTb;
  Function()? ontap;
  Function()? accepOrder;
  bool? isdonhang;
  String? type;

  ItemHoaDon({
    required this.model,
    this.isdonhang = false,
    this.closeTb,
    this.ontap,
    this.accepOrder,
    this.type
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
              Text("Bàn số: ${model.idTable}",style: StyleApp.style700.copyWith(fontSize: 18),),
              5.height,
              Text("Tổng bill: ${model.tongTien.toInt().toPrice()}đ",style: StyleApp.style500.copyWith(color: Colors.red,fontSize: 12),),
              5.height,
              Text("Trạng thái: Đã thanh toán",style: StyleApp.style500.copyWith(color: Colors.red,fontSize: 12),),
              5.height,
              Text("Nv phụ trách: ${model.fullname.validate()}",style: StyleApp.style500.copyWith(color: Colors.red,fontSize: 12),),
              const Spacer(),
              Text("Giờ vào: ${model.timeIn?.substring(0,5).validate()}",style: StyleApp.style400.copyWith(fontSize: 11),),
            ],
          ).expand(flex: 4),
          const Spacer(),
          isdonhang!
              ? Container(
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
          ).onTap(closeTb)
              : Align(
                    alignment: Alignment.bottomCenter,
                    child: model.trangThai == "0"
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
                    ).onTap(accepOrder)
                )
        ],
      ),
    ).onTap(ontap);
  }
}
