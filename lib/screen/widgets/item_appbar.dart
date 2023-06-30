import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:flutter/material.dart';

import '../../config/style_app/color_app.dart';

class itemAppBar extends StatelessWidget implements PreferredSizeWidget{

  List<Widget>? actions;
  String title;
  bool? align;
  bool? isback;


  itemAppBar({
    this.actions,
    required this.title,
    this.align,
    this.isback});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorApp.text,
      title: Text(
          title,
          style: StyleApp.style700.copyWith(color: Colors.white,fontSize: 18),),
      automaticallyImplyLeading: isback ?? true,
      elevation: 0,
      centerTitle: align ?? true,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
