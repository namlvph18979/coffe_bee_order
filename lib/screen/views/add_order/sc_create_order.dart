import 'package:coffe_bee_order/config/db/db_key_local.dart';
import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/data/remote_bloc/category/catbloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/floor/floor_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/detail_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/params/param_create_invoice.dart';
import 'package:coffe_bee_order/data/remote_bloc/table/table_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/model/user_model.dart';
import 'package:coffe_bee_order/screen/views/add_order/gep_ban/sc_ghep_ban.dart';
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
import 'widget/cart_bottom_bar.dart';


class ScreenCreateOrder extends StatefulWidget {

  @override
  State<ScreenCreateOrder> createState() => _ScreenCreateOrderState();
}

class _ScreenCreateOrderState extends State<ScreenCreateOrder>
    with SingleTickerProviderStateMixin {
  final cartbloc = ListCatbloc();
  final invoiceBloc = DetailInvoiceBloc();
  final floorbloc = floorBloc();
  final tablebloc = TableBloc();
  CreateHDParam param = CreateHDParam();
  UserModel user = UserModel();
  String timein = DateFormat("hh:mm a").format(DateTime.now());
  String? idfloor;

  late TabController tabController;
  String tdata = DateFormat("hh:mm a").format(DateTime.now());


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    var res = getJSONAsync(DBKeyLocal.user);
    if (res != null) {
      user = UserModel.fromJson(res);
    }
    reload();
  }

  Future<void> reload() async {
    floorbloc.getList();
  }

  @override
  Widget build(BuildContext context) {
     param = CreateHDParam(
      id_giamGia: "0",
      Id_user: user.Id_User.toString(),
      time_in: timein,
      time_out: "24:00",
      time_Data: timein,
      trangThai: "1",
    );

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
                  // invoiceBloc..clear();
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
          bottomNavigationBar: CartBottomBar(),
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
            child: SingleChildScrollView(
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
                              title: floorbloc.list[index].soTang,
                              onClick: () {
                                tabController.animateTo(1);
                                idfloor = floorbloc.list[index].idTang;
                                print("##############$idfloor");
                                tablebloc.getList(id: floorbloc.list[index].idTang);
                                // modelInvoice.idfloor =
                                //     floorbloc.list[index].idTang.toInt();
                                // modelInvoice.timeIn = tdata;
                                // print(
                                //     "############## tang: ${floorbloc.list[index].idTang}");
                                // setState(() {});
                              },
                            ))).scrollView(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget Tab2() {
    return BlocBuilder<TableBloc, CubitState>(
      bloc: tablebloc,
      builder: (context, state) {
        return LoadPage(
          state: state,
          height: MediaQuery.of(context).size.height,
          reload: () => tablebloc.getList(id: idfloor),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
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
                          ScreenGhepBan(listModel: tablebloc.list).launch(context);
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
                                    param.id_Table = tablebloc.list[index].id.toString();
                                    print(
                                        "############## bàn ${tablebloc.list[index].id} "
                                        "- tầng 1");
                                  });
                                }
                              ))
                    )
                  ]),
            ).scrollView(),
          ),
        );
      }
    );
  }

  Widget Tab3() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: SettingSection(
            title: Text(
              "Chọn Đồ uống".toUpperCase(),
              style: StyleApp.style700.copyWith(color: Colors.black),
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            items: [
              Screentab3(param: param),
            ]),
      ),
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
      child: Text("Tầng $title", style: StyleApp.style700.copyWith(fontSize: 20)),
    ).onTap(onClick);
  }
}
