import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ItemTabEmpty extends StatelessWidget {
  String? text;
  String? text1;
  Function()? ontap;
  ItemTabEmpty({this.text, this.text1,this.ontap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.fromLTRB(10, 12, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.green, width: 1),
            color: ColorApp.bg,
          ),
          child: Column(
            children: [
              Text(
                "Bàn ${text.validate()}",
                style: StyleApp.style600
                    .copyWith(color: Colors.green, fontSize: 12),
              ),
              const Spacer(),
              Text(
                "Đang trống",
                style: StyleApp.style600
                    .copyWith(color: Colors.green, fontSize: 12),
              ),
            ],
          ),
        ),
        Positioned(
            height: 15,
            top: -2,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                color: ColorApp.bg,
                child: Text(
                  "Tầng ${text1.validate()}",
                  style: StyleApp.style800
                      .copyWith(fontSize: 12, color: ColorApp.text),
                ))),
      ],
    ).onTap(ontap);
  }
}
