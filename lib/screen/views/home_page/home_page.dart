import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/image_path.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/product/bloc_prd.dart';
import 'package:coffe_bee_order/screen/views/home_page/widget/item_list_type_pro.dart';
import 'package:coffe_bee_order/screen/views/sc_more_item/sc_more.dart';
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
  ScrollController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reload();
    _controller = ScrollController();
  }

  reload() async {
    await bloc.getList1();
    await bloc.getList2();
    await bloc.getList3();
    await bloc.getList4();
    await bloc.getList5();
  }

  transiton(double potiotion) {
    _controller?.animateTo(potiotion,
        duration: const Duration(milliseconds: 600), curve: Curves.decelerate);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
        title: "Trang chủ",
        align: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => reload(),
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Sản phẩm thường nhật",
                  style: StyleApp.style700
                      .copyWith(fontSize: 18, color: Colors.black),
                ).paddingSymmetric(horizontal: 10),
              ),
              10.height,
              Container(
                width: MediaQuery.of(context).size.width,
                height: 65,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ItemListTypePro(
                          nameimg: listTypePro[index].nameimg,
                          title: listTypePro[index].title,
                          ontap: () {
                            transiton(index * 250 + 500);
                          },
                        ),
                    separatorBuilder: (context, index) => 5.width,
                    itemCount: listTypePro.length),
              ),
              20.height,
              BlocBuilder<BlocProduct, CubitState>(
                bloc: bloc,
                builder: (context, state) {
                  return LoadPage(
                      state: state,
                      reload: () => bloc.getList1(),
                      msg: state.msg,
                      child: ListHorizon(text: "Coffee", list: bloc.list1));
                },
              ),
              BlocBuilder<BlocProduct, CubitState>(
                bloc: bloc,
                builder: (context, state) {
                  return LoadPage(
                      state: state,
                      msg: state.msg,
                      reload: () => bloc.getList2(),
                      child: ListHorizon(text: "Trà sữa", list: bloc.list2));
                },
              ),
              BlocBuilder<BlocProduct, CubitState>(
                bloc: bloc,
                builder: (context, state) {
                  return LoadPage(
                      state: state,
                      reload: () => bloc.getList3(),
                      msg: state.msg,
                      child:
                          ListHorizon(text: "Đồ uống khác", list: bloc.list3));
                },
              ),
              BlocBuilder<BlocProduct, CubitState>(
                bloc: bloc,
                builder: (context, state) {
                  return LoadPage(
                      state: state,
                      msg: state.msg,
                      reload: () => bloc.getList4(),
                      child: ListHorizon(text: "Đồ ăn vặt", list: bloc.list4));
                },
              ),
              BlocBuilder<BlocProduct, CubitState>(
                bloc: bloc,
                builder: (context, state) {
                  return LoadPage(
                      state: state,
                      reload: () => bloc.getList5(),
                      msg: state.msg,
                      child:
                          ListHorizon(text: "Kem các loại", list: bloc.list5));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ListHorizon({String? text, List<ModelPro>? list}) {
    return list!.isNotEmpty
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      text!,
                      style: StyleApp.style700.copyWith(fontSize: 18),
                    ).expand(),
                    list.length > 2
                        ? TextIcon(
                            onTap: (){
                                ScMoreItem(list: list,title: text).launch(context);
                            },
                            text: "Xem thêm",
                            textStyle: StyleApp.style400
                                .copyWith(color: ColorApp.text, fontSize: 15),
                            spacing: 1,
                            suffix: const Icon(
                              Icons.chevron_right,
                              color: ColorApp.text,
                              size: 20,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                10.height,
                Container(
                  height: 210,
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
                    itemCount: list.length > 5 ? 5 : list.length,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
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
