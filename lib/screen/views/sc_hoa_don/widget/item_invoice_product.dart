import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../config/style_app/style_text.dart';


class ItemInVoiceProduct extends StatelessWidget {
  HoadonItems? model;
  bool isWatch;
  Function()? onTap;

  ItemInVoiceProduct({ this.model, required this.isWatch, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Tên sản phẩm:${model?.tenSp.validate()}",
            style: StyleApp.style600.copyWith(backgroundColor: ColorApp.text),
          ),
          5.height,
          Text(
           "Số lượng: ${model?.soLuong.validate()}",
            style: StyleApp.style600.copyWith(backgroundColor: ColorApp.text),
          ),
          5.height,
          Text(
            "Giá: ${model?.giaSp.validate()}",
            style: StyleApp.style600.copyWith(backgroundColor: ColorApp.text),
          ),
        ],
      ),
    );
  }
}
