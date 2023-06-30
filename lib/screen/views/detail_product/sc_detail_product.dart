import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/views/detail_product/wiget/itemother.dart';
import 'package:coffe_bee_order/screen/widgets/image_network_view.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config/style_app/color_app.dart';
import '../../../data/remote_bloc/product_model.dart';
import '../add_order/widget/modelbottomsheet.dart';

class ScreenDetailProduct extends StatefulWidget {
  ModelPro modelPro;
  List<ModelPro> list;

  ScreenDetailProduct({required this.modelPro, required this.list});

  @override
  State<ScreenDetailProduct> createState() => _ScreenDetailProductState();
}

class _ScreenDetailProductState extends State<ScreenDetailProduct> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, isMax) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            backgroundColor: ColorApp.text,
            centerTitle: false,
            elevation: 0,
            title: Text(
              widget.modelPro.name,
              style:
                  StyleApp.style700.copyWith(color: Colors.white, fontSize: 18),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ImageNetWorkView(
                  imageUrl: widget.modelPro.imageUrl, fit: BoxFit.cover),
              collapseMode: CollapseMode.pin,
            ),
          )
        ];
      },
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    15.height,
                    inforitem(
                        title: "Tên sản phẩm:",
                        des: widget.modelPro.name,
                        style: StyleApp.style600.copyWith(color: Colors.black)),
                    10.height,
                    inforitem(
                        title: "giá bán:",
                        des: "${widget.modelPro.price}đ",
                        style: StyleApp.style500.copyWith(color: Colors.red)),
                    10.height,
                    inforitem(
                        title: "Ưu đãi:",
                        des: widget.modelPro.discountPercent != null
                            ? "Giảm ${widget.modelPro.discountPercent}%"
                            : "Chưa có ưu đãi",
                        style: StyleApp.style500.copyWith(color: Colors.black)),
                    10.height,
                    Text(
                      "Mô tả: ",
                      style: StyleApp.style400,
                    ),
                    5.height,
                    ReadMoreText(
                      widget.modelPro.description!,
                      style: StyleApp.style400.copyWith(color: Colors.black),
                      trimLines: 10,
                      trimMode: TrimMode.Line,
                      textAlign: TextAlign.justify,
                      trimCollapsedText: " ...Show More ",
                      trimExpandedText: "   Show Less ",
                      colorClickableText: Colors.blue,
                    )
                  ],
                ),
              ),
              20.height,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sản phẩm liên quan",
                      style: StyleApp.style700.copyWith(fontSize: 16),
                    ),
                    10.height,
                    Container(
                      height: 220,
                      color: Colors.white,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ItemOther(
                            model: widget.list[index],
                            onTap: () {
                              ScreenDetailProduct(
                                modelPro: widget.list[index],
                                list: widget.list,
                              ).launch(context);
                            }),
                        separatorBuilder: (context, index) => 10.width,
                        itemCount: widget.list.length,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: itemButton(
            textBtn: "Dùng ngay".toUpperCase(),
            onPress: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => ModelBottomNote(
                        model: widget.modelPro,
                      ),
                  isScrollControlled: true,
                  shape: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))));
            }),
      ),
    );
  }

  inforitem({String? title, String? des, TextStyle? style}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: StyleApp.style400,
        ),
        10.width,
        Text(
          des!,
          style: style,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
