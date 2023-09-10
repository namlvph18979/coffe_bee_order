import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/data/remote_bloc/product/bloc_prd.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/item_category.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/item_tabbar_auth.dart';
import 'package:coffe_bee_order/screen/widgets/load/load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class Screentab3 extends StatefulWidget {
  ModelInvoice invoice;

  Screentab3({required this.invoice});

  @override
  State<Screentab3> createState() => _Screentab3State();
}

class _Screentab3State extends State<Screentab3>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final bloc = BlocProduct();
  @override
  void initState() {
    tabController = TabController(length: bloc.listCat.length, vsync: this);
    super.initState();
    reload();
  }

  reload() async {
    bloc.getList1();
    bloc.getList2();
    bloc.getList3();
    bloc.getList4();
    bloc.getList5();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocProduct, CubitState>(
      bloc: bloc,
      builder: (context, state) => Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 20),
        height: MediaQuery.of(context).size.height * 0.85,
        child: RefreshIndicator(
          onRefresh: () => reload(),
          child: ItemTabbarAuth(
              length: bloc.listCat.length,
              scroll: true,
              listTap: [
                Tab(text: 'Coffee (${bloc.list1.length})'),
                Tab(text: 'Trà sữa (${bloc.list2.length})'),
                Tab(text: 'Đồ uống khác (${bloc.list3.length})'),
                Tab(text: 'Đồ ăn vặt (${bloc.list4.length})'),
                Tab(text: 'Kem các loại (${bloc.list5.length})'),
              ],
              listTapBarView: [
                BlocBuilder<BlocProduct, CubitState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return LoadPage(
                      state: state,
                      msg: state.msg,
                      reload: () => bloc.getList1(),
                      height: null,
                      child: Tab(
                          child: bloc.list1.isNotEmpty
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) => ItemCategory(
                                        model: bloc.list1[index],
                                        list: bloc.list1,
                                        invoice: widget.invoice,
                                      ),
                                  separatorBuilder: (context, index) =>
                                      10.height,
                                  itemCount: bloc.list1.length)
                              : Center(
                                  child: Text(
                                    "Rất tiếc!\nhiện chưa có sản phẩm cho danh mục này!",
                                    style: StyleApp.style600
                                        .copyWith(color: ColorApp.text),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                    );
                  },
                ),
                BlocBuilder<BlocProduct, CubitState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return LoadPage(
                      state: state,
                      height: null,
                      reload: () => bloc.getList2(),
                      msg: state.msg,
                      child: Tab(
                        child: bloc.list2.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => ItemCategory(
                                      model: bloc.list2[index],
                                      list: bloc.list2,
                                      invoice: widget.invoice,
                                    ),
                                separatorBuilder: (context, index) => 10.height,
                                itemCount: bloc.list2.length)
                            : Center(
                                child: Text(
                                  "Rất tiếc!\nhiện chưa có sản phẩm cho danh mục này!",
                                  style: StyleApp.style600
                                      .copyWith(color: ColorApp.text),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                BlocBuilder<BlocProduct, CubitState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return LoadPage(
                      state: state,
                      reload: () => bloc.getList3(),
                      height: null,
                      msg: state.msg,
                      child: Tab(
                          child: bloc.list3.isNotEmpty
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) => ItemCategory(
                                        model: bloc.list3[index],
                                        list: bloc.list3,
                                        invoice: widget.invoice,
                                      ),
                                  separatorBuilder: (context, index) =>
                                      10.height,
                                  itemCount: bloc.list3.length)
                              : Center(
                                  child: Text(
                                    "Rất tiếc!\nhiện chưa có sản phẩm cho danh mục này!",
                                    style: StyleApp.style600
                                        .copyWith(color: ColorApp.text),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                    );
                  },
                ),
                BlocBuilder<BlocProduct, CubitState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return LoadPage(
                      state: state,
                      msg: state.msg,
                      height: null,
                      reload: () => bloc.getList4(),
                      child: Tab(
                        child: bloc.list4.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => ItemCategory(
                                      model: bloc.list4[index],
                                      list: bloc.list4,
                                      invoice: widget.invoice,
                                    ),
                                separatorBuilder: (context, index) => 10.height,
                                itemCount: bloc.list4.length)
                            : Center(
                                child: Text(
                                  "Rất tiếc!\nhiện chưa có sản phẩm cho danh mục này!",
                                  style: StyleApp.style600
                                      .copyWith(color: ColorApp.text),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                BlocBuilder<BlocProduct, CubitState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return LoadPage(
                      state: state,
                      height: null,
                      msg: state.msg,
                      reload: () => bloc.getList5(),
                      child: Tab(
                        child: bloc.list5.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) => ItemCategory(
                                      model: bloc.list5[index],
                                      list: bloc.list5,
                                      invoice: widget.invoice,
                                    ),
                                separatorBuilder: (context, index) => 10.height,
                                itemCount: bloc.list5.length)
                            : Center(
                                child: Text(
                                  "Rất tiếc!\nhiện chưa có sản phẩm cho danh mục này!",
                                  style: StyleApp.style600
                                      .copyWith(color: ColorApp.text),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
