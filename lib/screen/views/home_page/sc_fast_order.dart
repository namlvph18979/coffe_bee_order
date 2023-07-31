import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/image_path.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/product/bloc_prd.dart';
import 'package:coffe_bee_order/screen/views/home_page/widget/item_list_type_pro.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/load/load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config/style_app/style_text.dart';
import '../../../data/remote_bloc/product/product_model.dart';
import '../../widgets/image_network_view.dart';
import '../detail_product/sc_detail_product.dart';
import '../detail_product/wiget/itemother.dart';

class ScreenFastOrder extends StatefulWidget {
  const ScreenFastOrder({super.key});

  @override
  State<ScreenFastOrder> createState() => _ScreenFastOrderState();
}

class _ScreenFastOrderState extends State<ScreenFastOrder> {
  final bloc = BlocProduct();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getList1();
    bloc.getList2();
    bloc.getList3();
    bloc.getList4();
    bloc.getList5();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
        title: "Trang chủ",
        align: true,
      ),
      body: Column(
        children: [
          CarouselSlider(
              items: List.generate(
                  listSlide.length,
                  (index) => ImageNetWorkView(
                        imageUrl: listSlide[index],
                        fit: BoxFit.cover,
                      )),
              options: CarouselOptions(
                  height: 230,
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  autoPlay: listSlide.length > 1)),
          20.height,
          Text(
            "Sản phẩm thường nhật",
            style:
                StyleApp.style700.copyWith(fontSize: 18, color: Colors.black),
          ),
          10.height,
          Container(
            width: MediaQuery.of(context).size.width,
            height: 65,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(30)),
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ItemListTypePro(
                      nameimg: listTypePro[index].nameimg,
                      title: listTypePro[index].title,
                    ),
                separatorBuilder: (context, index) => 5.width,
                itemCount: listTypePro.length),
          ),
          20.height,
          BlocBuilder<BlocProduct, CubitState>(
            bloc: bloc,
            builder: (context, state) {
              return ListHorizon(text: "Coffee", list: bloc.list1);
            },
          ),
          BlocBuilder<BlocProduct, CubitState>(
            bloc: bloc,
            builder: (context, state) {
              return  ListHorizon(text: "Trà sữa", list: bloc.list2);
            },
          ),
          BlocBuilder<BlocProduct, CubitState>(
            bloc: bloc,
            builder: (context, state) {
              return ListHorizon(text: "Đồ uống khác", list: bloc.list3);
            },
          ),
          BlocBuilder<BlocProduct, CubitState>(
            bloc: bloc,
            builder: (context, state) {
              return ListHorizon(text: "Đồ ăn vặt", list: bloc.list4);
            },
          ),
          BlocBuilder<BlocProduct, CubitState>(
            bloc: bloc,
            builder: (context, state) {
              return ListHorizon(text: "Kem các loại", list: bloc.list5);
            },
          ),
        ],
      ).scrollView(),
    );
  }

  Widget ListHorizon({String? text, List<ModelPro>? list}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text!,
            style: StyleApp.style700.copyWith(fontSize: 16),
          ),
          10.height,
          Container(
            height: 210,
            color: ColorApp.bg,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ItemOther(
                  model: list[index],
                  onTap: () {
                    ScreenDetailProduct(
                      modelPro: list[index],
                      list: list,
                    ).launch(context);
                  }),
              separatorBuilder: (context, index) => 10.width,
              itemCount: list!.length,
            ),
          ),
        ],
      ),
    );
  }
}

List<ItemListTypePro> listTypePro = [
  ItemListTypePro(nameimg: ImagePath.icon_coffee, title: "Coffee"),
  ItemListTypePro(nameimg: ImagePath.icon_milktea, title: "Trà sữa"),
  ItemListTypePro(nameimg: ImagePath.icon_otherdrink, title: "khác"),
  ItemListTypePro(nameimg: ImagePath.icon_snack, title: "ăn vặt"),
  ItemListTypePro(nameimg: ImagePath.icon_icescream, title: "kem")
];
List<String> listSlide = [
  "https://hungrito.com/wp-content/uploads/2021/05/FEATURE-IMAGE.jpg",
  "https://inbimi.com/wp-content/uploads/2022/01/tra-sua-sai-gon-.jpg",
  "https://www.prudential.com.vn/export/sites/prudential-vn/vi/.thu-vien/hinh-anh/pulse-nhip-song-khoe/song-khoe/2022/thay-doi-co-the-moi-ngay-cung-nuoc-ep-1200x800-2.jpg",
  "https://tiki.vn/blog/wp-content/uploads/2023/02/cach-lam-kem-tuoi.jpg",
  "https://assets3.thrillist.com/v1/image/3068912/1200x630/flatten;crop_down;webp=auto;jpeg_quality=70"
];
