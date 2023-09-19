import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/detail_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/widget/item_hoa_don.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/load/load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class ScreenOrder extends StatefulWidget {
  const ScreenOrder({super.key});

  @override
  State<ScreenOrder> createState() => _ScreenOrderState();
}

class _ScreenOrderState extends State<ScreenOrder> {
  final bloc = ListInvoiceBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reload();
  }

  Future<void> reload() async {
    bloc.getListTT012();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(title: "Đơn hàng", align: true),
      body: BlocBuilder<ListInvoiceBloc, CubitState>(
        bloc: bloc,
        builder: (context, state) => LoadPage(
            state: state,
            reload: () => bloc.getListTT012(),
            msg: state.msg,
            child: bloc.invoicesTT012.isNotEmpty
                ? RefreshIndicator(
                  onRefresh: reload,
                  child: ListView.separated(
                      itemBuilder: (context, index) => ItemHoaDon(
                            model: bloc.invoicesTT012[index],
                            ontap: () {
                              ScreenDetailInvoice(
                                model: bloc.invoicesTT012[index],
                                isdonhang: true,
                              ).launch(context).then((value) => bloc.getListTT012());
                            },
                            closeTb: () {
                              setState(() => bloc.invoicesTT012.removeAt(index));
                            },
                          ),
                      separatorBuilder: (context, index) => 1.height,
                      itemCount: bloc.invoicesTT012.length),
                )
                : Center(
                    child: Text(
                      "Dang sách tống",
                      style: StyleApp.style600,
                    ),
                  )),
      ),
    );
  }
}
