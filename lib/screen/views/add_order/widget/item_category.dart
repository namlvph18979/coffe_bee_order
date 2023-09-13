
import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/screen/views/detail_product/sc_detail_product.dart';
import 'package:coffe_bee_order/screen/widgets/image_network_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../config/style_app/style_text.dart';
import '../../../../data/remote_bloc/product/product_model.dart';

class ItemCategory extends StatelessWidget {
  ModelPro model;
  List<ModelPro> list;
  Function()? ontap;


  ItemCategory({
    required this.model,
    required this.list,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          Positioned(
            child: ImageNetWorkView(
              imageUrl: model.anhSanPham ?? "",
              fit: BoxFit.cover,
              width: size.width,
              radius: BorderRadius.circular(5),
            ),
          ),
          Positioned(
              child: Container(
                  height: 120,
                  width: size.width / 2.8,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.black,
                            Colors.black87,
                            Colors.transparent
                          ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model.tenSp ?? "Chưa cập nhật",
                        style: StyleApp.style600
                            .copyWith(fontSize: 15, color: Colors.white),
                      ),
                      10.height,
                      Text(
                        "Size: ${model.size}",
                        style: StyleApp.style500
                            .copyWith(fontSize: 13, color: Colors.white),
                      ),
                      10.height,
                      Text(
                        "Giá: ${(double.tryParse(model.giaSanPham.validate())).toPrice()}đ",
                        style: StyleApp.style500
                            .copyWith(fontSize: 13, color: Colors.white),
                      ),
                    ],
                  ))),
          Positioned(
              top: 75,
              right: 10,
              child:const Icon(
                Icons.add_box,
                color: Colors.red,
                size: 28,
              ).onTap(ontap)
          ),
          Positioned(
              top: 8,
              right: 12,
              child: model.idGiamGia == "1"
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.center,
                              colors: <Color>[Colors.transparent, Colors.red])),
                      child: Text(
                          "Giảm ${10}%".toUpperCase(),
                          style: StyleApp.style600
                              .copyWith(color: Colors.white, fontSize: 11)),
                    )
                  : const SizedBox())
        ],
      ),
    ).onTap(() {
      ScreenDetailProduct(
          modelPro: model,
          list: list,
      ).launch(context);
    });
  }
}
