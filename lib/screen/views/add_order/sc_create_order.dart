import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/data/remote_bloc/category/catbloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/floor/floor_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/detail_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/data/remote_bloc/table/model/param/param_table.dart';
import 'package:coffe_bee_order/data/remote_bloc/table/table_bloc.dart';
import 'package:coffe_bee_order/screen/views/add_order/gep_ban/sc_ghep_ban.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/cart_bottom_bar.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/item_table.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/tab3.dart';
import 'package:coffe_bee_order/screen/widgets/load/load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../config/style_app/color_app.dart';
import '../../../config/style_app/style_text.dart';
import '../../../data/cubit_state.dart';
import '../../../data/remote_bloc/user/user_model.dart';

ModelInvoice modelInvoice = ModelInvoice(
    id: 1,
    type: 0,
    listSp: [],
    user: UserModel(
        id: 1,
        userName: "Nam lv0",
        passWord: "12345",
        phoneNumber: "123456789",
        Type: 0));

class ScreenCreateOrder extends StatefulWidget {
  ModelInvoice? model;

  @override
  State<ScreenCreateOrder> createState() => _ScreenCreateOrderState();
}

class _ScreenCreateOrderState extends State<ScreenCreateOrder>
    with SingleTickerProviderStateMixin {
  final cartbloc = ListCatbloc();
  final invoiceBloc = DetailInvoiceBloc();
  final floorbloc = floorBloc();
  final tablebloc = TableBloc();

  late TabController tabController;
  String tdata = DateFormat("hh:mm a").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    reload();
  }

  Future<void> reload() async {
    floorbloc.getList();
    tablebloc.getList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCatbloc, CubitState>(
      bloc: cartbloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 45,
            centerTitle: true,
            title: Text(
              "Tạo đơn",
              style: StyleApp.style600
                  .copyWith(color: ColorApp.text, fontSize: 18),
            ),
            leading: IconButton(
                onPressed: () {
                  if (tabController.index > 0) {
                    tabController.animateTo(tabController.index - 1);
                  } else {
                    finish(context);
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            actions: [
              IconButton(
                onPressed: () {
                  finish(context);
                },
                icon: const Icon(
                  Icons.clear_outlined,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Tab1(),
                Tab2(),
                Tab3(),
              ]),
          bottomSheet: CartBottomBar(model: modelInvoice),
        );
      },
    );
  }

  Widget Tab1() {
    return RefreshIndicator(
      onRefresh: reload,
      child: BlocBuilder<floorBloc, CubitState>(
        bloc: floorbloc,
        builder: (context, state) {
          return LoadPage(
            state: state,
            height: MediaQuery.of(context).size.height,
            reload: () => floorbloc.getList(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 30),
              child: SettingSection(
                  title: Text(
                    "Chọn Tầng".toUpperCase(),
                    style: StyleApp.style700.copyWith(color: Colors.black),
                  ),
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  items: List.generate(
                      floorbloc.list.length,
                      (index) => ItemOption(
                            title: floorbloc.list[index].name,
                            onClick: () {
                              tabController.animateTo(1);
                              modelInvoice.idfloor =
                                  floorbloc.list[index].id.toInt();
                              modelInvoice.timeIn = tdata;
                              print(
                                  "############## tang: ${floorbloc.list[index].id}");
                            },
                          ))).scrollView(),
            ),
          );
        },
      ),
    );
  }

  Widget Tab2() {
    return RefreshIndicator(
      onRefresh: reload,
      child: BlocBuilder<TableBloc, CubitState>(
        bloc: tablebloc,
        builder: (context, state) {
          return LoadPage(
            state: state,
            height: MediaQuery.of(context).size.height,
            reload: () => tablebloc.getList(),
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 50),
              child: SettingSection(
                  title: Row(
                    children: [
                      Text(
                        "Chọn Bàn".toUpperCase(),
                        style: StyleApp.style700.copyWith(color: Colors.black),
                      ),
                      const Spacer(),
                      TextIcon(
                        text: "Ghép",
                        textStyle: StyleApp.style600
                            .copyWith(color: ColorApp.text, fontSize: 16),
                        suffix: const Icon(Icons.compare,
                            size: 20, color: ColorApp.text),
                        onTap: () {
                          ScreenGhepBan(listModel: tablebloc.list)
                              .launch(context)
                              .then((value) {
                              print("#################### $value");

                              tablebloc.update(
                                  id: value[0].toString(),
                                  param: paramTable(
                                      isActive: true,

                                  ));
                              tablebloc.update(
                                  id: value[1].toString(),
                                  param: paramTable(
                                      isActive: true,
                                  ));
                          });
                        },
                      )
                    ],
                  ),
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  items: [
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 8.0,
                      children: List.generate(
                          tablebloc.list.length,
                          (index) => ItemTable(
                                model: tablebloc.list[index],
                                onClick: () {
                                  tabController.animateTo(2);
                                  setState(() {
                                    modelInvoice.idTable =
                                        tablebloc.list[index].id.toInt();

                                    print(
                                        "############## bàn ${tablebloc.list[index].id} "
                                        "- tầng ${modelInvoice.idfloor}");
                                  });
                                },
                              )),
                    )
                  ]),
            ).scrollView(),
          );
        },
      ),
    );
  }

  Widget Tab3() {
    return RefreshIndicator(
      onRefresh: reload,
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SettingSection(
            title: Text(
              "Chọn Đồ".toUpperCase(),
              style: StyleApp.style700.copyWith(color: Colors.black),
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            items: [
              Screentab3(invoice: modelInvoice),
            ]),
      ).scrollView(),
    );
  }

  Widget ItemOption({
    required String? title,
    Function()? onClick,
  }) {
    return Container(
      height: 130,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ColorApp.bg,
          border: Border.all(color: ColorApp.text, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Text(title!, style: StyleApp.style700.copyWith(fontSize: 20)),
    ).onTap(onClick);
  }
}
