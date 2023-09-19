import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:coffe_bee_order/data/check_state.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/order/order_for_pha_che/sc_accept_order.dart';
import 'package:coffe_bee_order/screen/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';
import '../../../../config/style_app/style_text.dart';

class itemOrderForPhaChe extends StatefulWidget {
  ModelInvoice model;

  itemOrderForPhaChe({
    required this.model,
  });

  @override
  State<itemOrderForPhaChe> createState() => _itemOrderForPhaCheState();
}

class _itemOrderForPhaCheState extends State<itemOrderForPhaChe> {
  final bloc = ListInvoiceBloc();

  changeTT() {
    bloc.updateTTDon(trangThai: "1", id: widget.model.idHoaDonCT);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: ColorApp.text, width: 1)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.idTable != null ?"Bàn số: ${widget.model.idTable}" : "Đơn mang đi",
                  style: StyleApp.style700.copyWith(fontSize: 18),
                ),
                5.height,
                Text(
                  "Số lượng: ${widget.model.hoadonItems!.length} món",
                  style: StyleApp.style500
                      .copyWith(color: Colors.red, fontSize: 12),
                ),
                5.height,
                Text(
                  "Trạng thái: Đã thanh toán",
                  style: StyleApp.style500
                      .copyWith(color: Colors.red, fontSize: 12),
                ),
                const Spacer(),
                Text(
                  "Giờ vào: ${widget.model.timeIn}",
                  style: StyleApp.style400.copyWith(fontSize: 11),
                ),
              ],
            ).expand(flex: 4),
            const Spacer(),
            if (widget.model.trangThai == "0")
              BlocConsumer<ListInvoiceBloc, CubitState>(
                bloc: bloc,
                listener: (context, state) {
                  CheckStateBloc.checkNoLoad(
                    context,
                    state,
                    msg: state.msg,
                    isShowMsg: true,
                    success: () {
                      context.read<ListInvoiceBloc>().getListTT01();
                      ScreenAcceptOrder(
                        invoice: widget.model,
                      ).launch(context);
                    },
                  );
                },
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                        title: "Nhận đơn",
                        onTap: changeTT,
                        padding: 5,
                        isLoad: state.status == BlocStatus.loading,
                        color: ColorApp.text,
                        textColor: Colors.white),
                  );
                },
              )
            else
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    pause: const Duration(milliseconds: 100),
                    animatedTexts: [
                      WavyAnimatedText("Đang được xử lý...",
                          textStyle: StyleApp.style500.copyWith(fontSize: 12))
                    ]),
              )
          ],
        ));
  }
}
