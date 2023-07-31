import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/style_text.dart';
import '../../../../data/remote_bloc/product/product_model.dart';
import '../../../widgets/image_network_view.dart';

class ItemInVoiceProduct extends StatelessWidget {
  ModelPro model;
  bool isWatch;
  Function()? onTap;

  ItemInVoiceProduct({
    required this.model,
    required this.isWatch,
    this.onTap
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
              imageUrl: model.anhSanPham!,
              fit: BoxFit.cover,
              width: size.width,
              radius: BorderRadius.circular(5),
            ),
          ),
          Positioned(
              child: Container(
                  height: 120,
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
                        "${model.tenSp} × ${model.soluong}",
                        style: StyleApp.style600
                            .copyWith(fontSize: 16, color: Colors.white),
                      ),
                      5.height,
                      Text(
                        model.idGiamGia == "1"
                        ? "${(double.tryParse(model.giaSanPham!)! * model.soluong!).toPrice()}đ"
                        : "${((double.tryParse(model.giaSanPham!)! * model.soluong!) * (100 - 10)~/100).toPrice()}đ",
                        style: StyleApp.style500
                            .copyWith(fontSize: 13, color: Colors.redAccent),
                      ),
                    ],
                  ))),
          Positioned(
              bottom: 5,
              left: 15,
              child:  model.note != null && model.note!.trim() != ""
              ? Text("Lưu ý: ${model.note}",style: StyleApp.style500.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis
              ),)
              : const SizedBox()),
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
                  : const SizedBox()),
          Positioned(
                  top: 75,
                  right: 5,
                  child: !isWatch
                      ? const Icon(Icons.delete_forever,color: Colors.red,size: 30,).onTap(onTap)
                      : const SizedBox()
          )

        ],
      ),
    );
  }
}
