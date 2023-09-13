import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/model/user_model.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/item_tabbar_auth.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/detail_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_print_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/widget/item_hoa_don.dart';
import 'package:coffe_bee_order/screen/widgets/dialog/confirm_dialog.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/load/load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../data/remote_bloc/invoice/list_invoice_bloc.dart';
import '../../../data/remote_bloc/invoice/model_invoice.dart';
import '../../../data/remote_bloc/product/product_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
          title: "Hoá đơn",
          isback: false,
          align: true),
      body: ItemTabbarAuth(
          length: 3,
          listTap: const [
            Tab(text: "Tầng 1",height: 40,),
            Tab(text: "Tầng 2",height: 40,),
            Tab(text: "Tầng 3",height: 40,),
          ],
          listTapBarView: [
            Tab1(),
            Tab1(),
            Tab1(),
          ]),
    );
  }

  Widget Tab1(){
    return BlocBuilder<ListInvoiceBloc, CubitState>(
      bloc: bloc,
      builder: (context, state) {
        return  LoadPage(
          state: state,
          reload: () {
            bloc.getList();
          },
          msg: state.msg,
          child:bloc.invoices.isNotEmpty ? ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => ItemHoaDon(
                model: bloc.invoices[index],
                isdonhang: true,

                ontap: (){
                  ScreenDetailInvoice(
                    model: bloc.invoices[index],
                    isdonhang: false,
                  ).launch(context);
                },
              ),
              separatorBuilder: (context, index) => 1.height,
              itemCount: bloc.invoices.length
          ) : Center(child: Text("Danh sách trống",style: StyleApp.style600,),)
        );
      },
    );
  }
}
