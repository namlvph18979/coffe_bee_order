import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/style_text.dart';


class ItemListTypePro extends StatelessWidget {
  String nameimg;
  String title;
  Function()? ontap;

  ItemListTypePro({
    required this.nameimg,
    required this.title,
    this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin:const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Image.asset(nameimg,width: 35,height: 35),
            5.height,
            Text(title,style: StyleApp.style600.copyWith(fontSize: 12,color: Colors.black),)
          ],
        ),
      ),
    );
  }
}
