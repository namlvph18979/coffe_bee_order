import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/detail_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/widget/item_hoa_don.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/load/load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../data/remote_bloc/invoice/list_invoice_bloc.dart';
import '../../../data/remote_bloc/invoice/model_invoice.dart';

class Screeninvoice extends StatefulWidget {

  ModelInvoice? model;

  Screeninvoice({this.model});
  @override
  State<Screeninvoice> createState() => _ScreeninvoiceState();
}


class _ScreeninvoiceState extends State<Screeninvoice> {
  final bloc = ListInvoiceBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getListDone();
  }

  Future<void> reload() async {
    await bloc.getListDone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
          title: "Hoá đơn",
          isback: false,
          align: true),
      body: BlocBuilder<ListInvoiceBloc, CubitState>(
        bloc: bloc,
        builder: (context, state) {
          return  LoadPage(
              state: state,
              reload: () {
                bloc.getList();
              },
              msg: state.msg,
              child:bloc.invoicesTT3.isNotEmpty ? RefreshIndicator(
                onRefresh: reload,
                child: ListView.separated(
                    itemBuilder: (context, index) => ItemHoaDon(
                      model: bloc.invoicesTT3[index],
                      isdonhang: true,
                      ontap: (){
                        ScreenDetailInvoice(
                          model: bloc.invoicesTT3[index],
                          isdonhang: false,
                        ).launch(context).then((value) => bloc.getListDone());
                      },
                    ),
                    separatorBuilder: (context, index) => 1.height,
                    itemCount: bloc.invoicesTT3.length
                ),
              ) : Center(child: Text("Danh sách trống",style: StyleApp.style600,),)
          );
        },
      ),
    );
  }
}
