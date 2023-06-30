import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/style_text.dart';


class ItemListTypePro extends StatelessWidget {
  String nameimg;
  String title;

  ItemListTypePro({
    required this.nameimg,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Image.asset(nameimg,width: 35,height: 35),
          5.height,
          Text(title,style: StyleApp.style500.copyWith(fontSize: 12,color: Colors.black),)
        ],
      ),
    );
  }
}
