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
    bloc.getList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
          title: "Đơn hàng",
          align: true),
      body: BlocBuilder<ListInvoiceBloc,CubitState>(
        bloc: bloc,
        builder: (context, state) => LoadPage(
          state: state,
          reload: () => bloc.getList(),
          msg: state.msg,
          child: bloc.invoices.isNotEmpty ?  ListView.separated(
              itemBuilder: (context, index) => ItemHoaDon(
                model: bloc.invoices[index],
                ontap: () {
                  ScreenDetailInvoice(
                    model: bloc.invoices[index],
                    isdonhang: true,
                  ).launch(context);
                },
                accepOrder: () {
                  toast("Xác nhận đơn thành công");
                },
                closeTb: () {setState(() => bloc.invoices.removeAt(index));},
              ),
              separatorBuilder: (context, index) => 1.height,
              itemCount: bloc.invoices.length) : Center(child: Text("Dang sách tống",style: StyleApp.style600,),)
        ),
      ),
    );
  }
}
