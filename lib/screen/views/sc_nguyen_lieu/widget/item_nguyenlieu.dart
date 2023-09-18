import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/widgets/image_network_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../data/remote_bloc/nguyenlieu/nguyenlieu_model.dart';

class ItemNguyenLieu extends StatelessWidget {
  ModelNL model;

  ItemNguyenLieu({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.8, color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageNetWorkView(
            imageUrl: model.imgNguyenLieu.validate(),
            height: 135,
            radius: const BorderRadius.vertical(top: Radius.circular(5)),
            fit: BoxFit.cover,
          ),
          10.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.tenNguyenLieu!,
                  style: StyleApp.style600.copyWith(
                      color: Colors.black, overflow: TextOverflow.ellipsis),
                  maxLines: 1),
              5.height,
              Text(
                    "Số lượng: ${model.soLuong.validate()}/${model.kieuNguyenLieu.validate()}",
                style: StyleApp.style400
                    .copyWith(color: Colors.black, fontSize: 12),
              ),
              5.height,
              Text(
                model.price != null
                    ? "Giá: ${model.price.toInt().toPrice()}đ"
                    : "Giá: Chưa cập nhật",
                style: StyleApp.style400
                    .copyWith(color: Colors.black, fontSize: 12),
              ),
            ],
          ).paddingSymmetric(horizontal: 5),
        ],
      ),
    );
  }
}
