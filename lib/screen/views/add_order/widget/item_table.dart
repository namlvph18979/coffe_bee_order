import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffe_bee_order/data/remote_bloc/table/model/Table_model.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';
import '../../../../config/style_app/style_text.dart';


class ItemTable extends StatelessWidget {

  TableModel? model;
  Function()? onClick;

  ItemTable({
    this.model,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorApp.bg,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
            color: !model!.isActive! ? Colors.green : ColorApp.text,
            width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(model!.name!,style: StyleApp.style600.copyWith(fontSize: 16),),
          !model!.isActive!
              ? Text("Đang trống",style: StyleApp.style500.copyWith(fontSize: 12,color: Colors.green),)
              : AnimatedTextKit(
              isRepeatingAnimation: true,
              repeatForever: true,
              pause:const Duration(milliseconds: 100),
              animatedTexts: [
                WavyAnimatedText("Đang hoạt động...",
                    textStyle: StyleApp.style500.copyWith(fontSize: 9))
              ]),
        ],
      ),
    ).onTap(
        !model!.isActive!
            ? onClick
            : (){toast("Bàn hiện đang có người");}
    );
  }
}
