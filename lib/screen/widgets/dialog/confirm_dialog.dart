import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config/style_app/color_app.dart';

class ConfirmDialog extends StatelessWidget {

  String title;
  String des;
  Function()? ontap1;
  Function()? ontap2;
  String? text1;
  String? text2;


  ConfirmDialog({
    required this.title,
    required this.des,
    this.ontap1,
    this.ontap2,
    this.text1,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      height: 250,
      decoration: BoxDecoration(
        color: ColorApp.bg,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          15.height,
          Text(title,style: StyleApp.style800.copyWith(fontSize: 24)),
          10.height,
          Text(des,style: StyleApp.style400,textAlign: TextAlign.center),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text(text1 ?? "Huỷ bỏ",style: StyleApp.style700.copyWith(fontSize: 15,color: Colors.white),),
              ).onTap(ontap1),
              Container(
                width: 100,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Text(text2 ?? "Đồng ý",style: StyleApp.style700.copyWith(fontSize: 15,color: Colors.white),),
              ).onTap(ontap2),
            ],
          )
        ],
      ),
    );
  }
}
