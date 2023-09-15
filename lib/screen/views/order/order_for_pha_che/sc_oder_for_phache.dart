import 'package:audioplayers/audioplayers.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/screen/views/order/order_for_pha_che/sc_accept_order.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/load/load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import '../widget/item_all.dart';

class ScreenOrderForPhaChe extends StatefulWidget {
  const ScreenOrderForPhaChe({super.key});

  @override
  State<ScreenOrderForPhaChe> createState() => _ScreenOrderForPhaCheState();
}

class _ScreenOrderForPhaCheState extends State<ScreenOrderForPhaChe> {

  final bloc = ListInvoiceBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reload();
  }

  Future<void> reload() async {
    bloc.getListTT01();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
        title: "Đơn Chờ Xử Lý",
        align: true,
        isback: false,
      ),
      body: BlocBuilder<ListInvoiceBloc,CubitState>(
        bloc: bloc,
        builder: (context, state) => LoadPage(
          state: state,
          msg: state.msg,
          reload: () => bloc.getList(),
          child: bloc.invoicesTT01.isNotEmpty ? RefreshIndicator(
            onRefresh: reload,
            child: ListView.separated(
                itemBuilder: (context, index) => ItemAll(
                    model: bloc.invoicesTT01[index],
                ),
                separatorBuilder: (context, index) => 20.height,
                itemCount: bloc.invoicesTT01.length).paddingTop(15),
          ):Center(child: Text("Danh sách trống",style: StyleApp.style600,),)
        ),
      ),
    );
  }
}
