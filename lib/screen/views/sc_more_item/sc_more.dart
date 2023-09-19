import 'package:coffe_bee_order/data/remote_bloc/product/bloc_prd.dart';
import 'package:coffe_bee_order/data/remote_bloc/product/product_model.dart';
import 'package:coffe_bee_order/screen/views/detail_product/sc_detail_product.dart';
import 'package:coffe_bee_order/screen/views/detail_product/wiget/itemother.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/load/grid_view_custom.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ScMoreItem extends StatelessWidget {
  String? title;
  List<ModelPro> list;
  ScMoreItem({this.title,required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(title: title ?? "Danh mục sản phẩm"),
      body: GridViewCustom(
        itemCount: list.length,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        maxWight: double.infinity,
        mainAxisExtent: 210,
        itemBuilder: (context, index) => ItemOther(model: list[index],onTap: (){
          ScreenDetailProduct(
          modelPro: list[index],
          list: list,
        ).launch(context);}),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        scrollDirection: Axis.vertical,
        showFull: true,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 5,
      ),
    );
  }
}
