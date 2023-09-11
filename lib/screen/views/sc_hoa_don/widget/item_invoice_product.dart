import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../config/style_app/style_text.dart';
import 'package:coffe_bee_order/config/extention/int_ext.dart';


class ItemInVoiceProduct extends StatelessWidget {
  HoadonItems? model;
  bool isWatch;
  Function()? onTap;

  ItemInVoiceProduct({ this.model, required this.isWatch, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tên sản phẩm: ${model?.tenSp.validate()}",
            style: StyleApp.style400.copyWith(color: ColorApp.text),
          ),
          5.height,
          Text(
           "Số lượng: ${model?.soLuong.validate()}",
            style: StyleApp.style400.copyWith(color: ColorApp.text),
          ),
          5.height,
          Text(
            "Giá: ${(double.tryParse(model?.giaSp.validate() ?? "0")).toPrice()}đ",
            style: StyleApp.style400.copyWith(color: ColorApp.text),
          ),
        ],
      ),
    );
  }
}
