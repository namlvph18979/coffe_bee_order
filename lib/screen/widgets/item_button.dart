import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../config/style_app/color_app.dart';

class itemButton extends StatelessWidget {

  String textBtn;
  double? width;
  Function()? onPress;

  itemButton({required this.textBtn,this.width,this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width ?? MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorApp.text,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(textBtn,style: StyleApp.style700.copyWith(color: Colors.white),),
    ).onTap(onPress);
  }
}
