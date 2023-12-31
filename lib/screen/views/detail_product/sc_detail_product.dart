import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/views/detail_product/wiget/itemother.dart';
import 'package:coffe_bee_order/screen/widgets/image_network_view.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config/style_app/color_app.dart';
import '../../../data/remote_bloc/product/product_model.dart';
import '../add_order/widget/model_bottom_not.dart';

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
              widget.modelPro.tenSp ?? "Chưa cập nhật",
              style:
                  StyleApp.style700.copyWith(color: Colors.white, fontSize: 18),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ImageNetWorkView(
                  imageUrl: widget.modelPro.anhSanPham ?? "", fit: BoxFit.cover),
              collapseMode: CollapseMode.pin,
            ),
          )
        ];
      },
      body: Scaffold(
        body: Column(
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
                      des: widget.modelPro.tenSp,
                      style: StyleApp.style600.copyWith(color: Colors.black)),
                  10.height,
                  inforitem(
                      title: "giá bán:",
                      des: widget.modelPro.idGiamGia == "1"
                      ? "${(((double.tryParse(widget.modelPro.giaSanPham!)!) * (100 - 10)~/100)).toPrice()}đ"
                      : "${double.tryParse(widget.modelPro.giaSanPham!).toPrice()}đ",
                      style: StyleApp.style500.copyWith(color: Colors.red)),
                  10.height,
                  inforitem(
                      title: "Ưu đãi:",
                      des: widget.modelPro.idGiamGia == "1"
                          ? "Giảm ${10}%"
                          : "Chưa có ưu đãi",
                      style: StyleApp.style500.copyWith(color: Colors.black)),
                  10.height,
                  Text(
                    "Mô tả: ",
                    style: StyleApp.style400,
                  ),
                  5.height,
                  ReadMoreText(
                    widget.modelPro.gioiThieu ?? "Chưa cập nhật",
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
        ).scrollView(),
        bottomSheet: itemButton(
            textBtn: "Dùng ngay".toUpperCase(),
            onPress: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => ModelBottomNote(
                      model: widget.modelPro),
                  isScrollControlled: true,
                  shape: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20))));
                // finish(context);
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
