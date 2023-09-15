import 'package:audioplayers/audioplayers.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/check_state.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/widgets/custom_button.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';

class ScreenAcceptOrder extends StatefulWidget {

  ModelInvoice invoice;

  ScreenAcceptOrder({required this.invoice});

  @override
  State<ScreenAcceptOrder> createState() => _ScreenAcceptOrderState();
}

class _ScreenAcceptOrderState extends State<ScreenAcceptOrder> {

  final bloc = ListInvoiceBloc();

  changeTT() {
    bloc.updateTTDon(trangThai: "2", id: widget.invoice.idHoaDonCT);
  }

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return Scaffold(
      appBar: itemAppBar(
        title: "Đơn Bàn số ${widget.invoice.idTable} - Tầng 1",
        isback: false,
        align: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) =>
              itemfr(
                  text: widget.invoice.hoadonItems?[index].tenSp,
                  sl: widget.invoice.hoadonItems?[index].soLuong,
                  note: widget.invoice.hoadonItems![index].ghiChu
              ),
          separatorBuilder: (context, index) => 15.height,
          itemCount: widget.invoice.hoadonItems!.length
      ).paddingSymmetric(horizontal: 10, vertical: 15),
      bottomSheet: BlocConsumer<ListInvoiceBloc, CubitState>(
        bloc: bloc,
        listener: (context, state) {
          CheckStateBloc.checkNoLoad(
              context,
              state,
              msg: state.msg,
              isShowMsg: true,
              success: () {
                finish(context);
                  player.play(AssetSource('sound/success_order.mp3'));
                  setState(() {
                    finish(context);
                });
            },
          );
        },
        builder: (context, state) {
          return CustomButton(
            title: "Hoàn thành đơn".toUpperCase(),
            onTap: changeTT,
            isLoad: state.status == BlocStatus.loading
          );
        },
      ).withWidth(double.infinity).paddingSymmetric(
          horizontal: 10, vertical: 10),
    );
  }

  Widget itemfr({
    required String? text,
    String? sl,
    String? note}) {
    return Container(

      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorApp.text, width: 1),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("$text", style: StyleApp.style600.copyWith(fontSize: 15),)
                  .expand(flex: 3),
              Text("SL: ×$sl", style: StyleApp.style600,).expand(flex: 1)
            ],
          ),
          note!.isNotEmpty
              ? Text("Lưu ý: $note", style: StyleApp.style400,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,).paddingTop(10)
              : const SizedBox()
        ],
      ),
    );
  }
}
