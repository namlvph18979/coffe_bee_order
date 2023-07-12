import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/model_bottom_not.dart';
import 'package:coffe_bee_order/screen/views/detail_product/sc_detail_product.dart';
import 'package:coffe_bee_order/screen/widgets/image_network_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/style_text.dart';
import '../../../../data/remote_bloc/product/product_model.dart';

class ItemCategory extends StatefulWidget {
  ModelPro model;
  List<ModelPro> list;
  ModelInvoice invoice;


  ItemCategory({
    required this.model,
    required this.list,
    required this.invoice
  });

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
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
              imageUrl: widget.model.imageUrl ?? "",
              fit: BoxFit.cover,
              width: size.width,
              radius: BorderRadius.circular(5),
            ),
          ),
          Positioned(
              child: Container(
                  height: 120,
                  width: size.width / 3,
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
                        widget.model.name ?? "Chưa cập nhật",
                        style: StyleApp.style600
                            .copyWith(fontSize: 16, color: Colors.white),
                      ),
                      15.height,
                      Text(
                        "Giá: ${widget.model.price.toPrice()}đ",
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
              ).onTap((){
                showModalBottomSheet(
                    context: context,
                    builder: (context) => ModelBottomNote(
                      model: widget.model),
                    isScrollControlled: true,
                    shape: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20)))).then((value){
                              if(value == null){
                                return;
                              }
                              ModelPro model1 = value;
                              widget.invoice.listSp!.add(model1);
                              print("ten luong : ${model1.name}");
                });
              })
          ),
          Positioned(
              top: 8,
              right: 12,
              child: widget.model.discountPercent != null
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
                          "Giảm ${widget.model.discountPercent}%".toUpperCase(),
                          style: StyleApp.style600
                              .copyWith(color: Colors.white, fontSize: 11)),
                    )
                  : const SizedBox())
        ],
      ),
    ).onTap(() {
      ScreenDetailProduct(
          modelPro: widget.model,
          list: widget.list,
      ).launch(context);
    });
  }
}
