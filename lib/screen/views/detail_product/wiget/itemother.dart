import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/data/remote_bloc/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/style_text.dart';
import '../../../widgets/image_network_view.dart';

class ItemOther extends StatelessWidget {

  ModelPro model;
  Function? onTap;


  ItemOther({
    required this.model,
    this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 0.8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageNetWorkView(
                  imageUrl: model.imageUrl!,
                  height: 155,
                  fit: BoxFit.cover,
                  radius: const BorderRadius.vertical(top: Radius.circular(5)),
                ),
                5.height,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name!,
                        style: StyleApp.style600.copyWith(
                            color: Colors.black, overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                      5.height,
                      Text(
                        "${model.price.toPrice()}đ",
                        style: StyleApp.style500
                            .copyWith(color: Colors.red, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 10,
              right: 15,
              child: model.discountPercent != null
                  ? Container(
                    padding:const EdgeInsets.symmetric(horizontal: 3,vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3)
                    ),
                    child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText(
                          // duration: const Duration(milliseconds: 1500)
                          speed: const Duration(milliseconds: 220),
                          curve: Curves.decelerate,
                          "Giảm ${model.discountPercent}%",
                          textStyle:StyleApp.style700
                              .copyWith(color: Colors.red ))
                    ]
              ),
                  )
                  : const SizedBox())
        ]).onTap(onTap);
  }
}
