import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/image_path.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/product/bloc_prd.dart';
import 'package:coffe_bee_order/data/remote_bloc/table/model/Table_model.dart';
import 'package:coffe_bee_order/data/remote_bloc/table/table_bloc.dart';
import 'package:coffe_bee_order/screen/views/add_order/sc_create_order.dart';
import 'package:coffe_bee_order/screen/views/home_page/widget/item_empty_table.dart';
import 'package:coffe_bee_order/screen/views/home_page/widget/item_list_type_pro.dart';
import 'package:coffe_bee_order/screen/views/sc_more_item/sc_more.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/load/grid_view_custom.dart';
import 'package:coffe_bee_order/screen/widgets/load/load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config/style_app/style_text.dart';
import '../../../data/remote_bloc/product/product_model.dart';

import '../detail_product/sc_detail_product.dart';
import '../detail_product/wiget/itemother.dart';

class ScreenFastOrder extends StatefulWidget {
  const ScreenFastOrder({super.key});

  @override
  State<ScreenFastOrder> createState() => _ScreenFastOrderState();
}

class _ScreenFastOrderState extends State<ScreenFastOrder> {
  final bloc = BlocProduct();
  final tableBloc = TableBloc();
  ScrollController? _controller;
  String? trangThai;
  TableModel? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tableBloc.getListEmpty();
    bloc.getList1();
    bloc.getList2();
    bloc.getList3();
    bloc.getList4();
    bloc.getList5();
    _controller = ScrollController();
  }

  Future<void> reload() async {
      bloc.getList1();
      bloc.getList2();
      bloc.getList3();
      bloc.getList4();
      bloc.getList5();
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
        onRefresh: reload,
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Danh sách bàn trống",
                  style: StyleApp.style700
                      .copyWith(color: Colors.black, fontSize: 18),
                ).paddingOnly(left: 10, top: 10),
              ),
              emptyTable(),
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
                            transiton(index * 250 + 400);
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
                      child:
                          ListHorizon(text: "Coffee", list: bloc.listCoffees));
                },
              ),
              BlocBuilder<BlocProduct, CubitState>(
                bloc: bloc,
                builder: (context, state) {
                  return LoadPage(
                      state: state,
                      msg: state.msg,
                      reload: () => bloc.getList2(),
                      child: ListHorizon(
                          text: "Trà sữa", list: bloc.listMilkTeas));
                },
              ),
              BlocBuilder<BlocProduct, CubitState>(
                bloc: bloc,
                builder: (context, state) {
                  return LoadPage(
                      state: state,
                      reload: () => bloc.getList3(),
                      msg: state.msg,
                      child: ListHorizon(
                          text: "Đồ uống khác", list: bloc.listOtherDrinks));
                },
              ),
              BlocBuilder<BlocProduct, CubitState>(
                bloc: bloc,
                builder: (context, state) {
                  return LoadPage(
                      state: state,
                      msg: state.msg,
                      reload: () => bloc.getList4(),
                      child: ListHorizon(
                          text: "Đồ ăn vặt", list: bloc.listSnacks));
                },
              ),
              BlocBuilder<BlocProduct, CubitState>(
                bloc: bloc,
                builder: (context, state) {
                  return LoadPage(
                      state: state,
                      reload: () => bloc.getList5(),
                      msg: state.msg,
                      child: ListHorizon(
                          text: "Kem các loại", list: bloc.listIceCreams));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emptyTable() {
    return BlocBuilder<TableBloc, CubitState>(
        bloc: tableBloc,
        builder: (context, state) {
          return LoadPage(
              state: state,
              reload: () => tableBloc.getListEmpty(),
              height: 200,
              child: tableBloc.listEmpty.length != 0
                  ? GridViewCustom(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          showFull: true,
                          mainAxisExtent: 90,
                          padding: EdgeInsets.all(10),
                          scrollDirection: Axis.horizontal,
                          itemCount: tableBloc.listEmpty.length,
                          itemBuilder: (context, index) => ItemTabEmpty(
                              text: tableBloc.listEmpty[index].soBan,
                              text1: tableBloc.listEmpty[index].idTang,
                              ontap: () {
                                context.read<ListInvoiceBloc>().param.id_Table = tableBloc.listEmpty[index].idTable.toInt();
                                ScreenCreateOrder(tab: 2).launch(context);
                              },
                          ))
                      .withHeight(200)
                  : Center(
                      child: Text(
                        "Rất tiếc hiện không còn bàn nào trống!",
                        style: StyleApp.style600
                            .copyWith(color: ColorApp.text, fontSize: 16),
                      ),
                    ).withHeight(100));
        });
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
                            onTap: () {
                              ScMoreItem(list: list, title: text)
                                  .launch(context);
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
                          print("#########"+list[index].anhSanPham.validate().substring(2));
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
