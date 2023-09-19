import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/check_state.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/detail_invoice.dart';
import 'package:coffe_bee_order/screen/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';

class ItemHoaDon extends StatefulWidget {
  ModelInvoice model;
  Function()? closeTb;
  Function()? ontap;
  bool? isdonhang;
  String? type;

  ItemHoaDon(
      {required this.model,
      this.isdonhang = false,
      this.closeTb,
      this.ontap,
      this.type});

  @override
  State<ItemHoaDon> createState() => _ItemHoaDonState();
}

class _ItemHoaDonState extends State<ItemHoaDon> {
  final bloc = ListInvoiceBloc();

  acceptOrder() {
    bloc.updateTTDon(id: widget.model.idHoaDonCT, trangThai: "3");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorApp.text, width: 1)),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model.idTable != null
                    ? "Bàn số: ${widget.model.idTable}"
                    : "Đơn mang đi số ${widget.model.idHoaDonCT}",
                style: StyleApp.style700.copyWith(fontSize: 18),
              ),
              5.height,
              Text(
                "Tổng bill: ${widget.model.tongTien.toInt().toPrice()}đ",
                style:
                    StyleApp.style500.copyWith(color: Colors.red, fontSize: 12),
              ),
              5.height,
              Text(
                "Trạng thái: Đã thanh toán",
                style:
                    StyleApp.style500.copyWith(color: Colors.red, fontSize: 12),
              ),
              5.height,
              Text(
                "Nv phụ trách: ${widget.model.fullname.validate()}",
                style:
                    StyleApp.style500.copyWith(color: Colors.red, fontSize: 12),
              ),
              const Spacer(),
              Text(
                "Giờ vào: ${widget.model.timeIn.validate()}",
                style: StyleApp.style400.copyWith(fontSize: 11),
              ),
            ],
          ).expand(flex: 4),
          const Spacer(),
          widget.isdonhang!
              ? Container(
                  height: 30,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorApp.text,
                      borderRadius: BorderRadius.circular(5)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Đóng bàn",
                    style: StyleApp.style600
                        .copyWith(color: Colors.white, fontSize: 12),
                  ),
                ).onTap(widget.closeTb)
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: widget.model.trangThai.toString() == "2"
                      ?
                  // BlocConsumer<ListInvoiceBloc, CubitState>(
                  //         bloc: bloc,
                  //         listener: (context, state) {
                  //           CheckStateBloc.checkNoLoad(
                  //             context,
                  //             state,
                  //             isShowMsg: true,
                  //             msg: state.msg,
                  //             success: () {
                  //               context.read<ListInvoiceBloc>()..getListDone();
                  //               context.read<ListInvoiceBloc>().getListTT012();
                  //             },
                  //           );
                  //         },
                  //         builder: (context, state) {
                  //           return
                              CustomButton(
                                title: "Nhận đơn",
                                color: ColorApp.text,
                                onTap: () {
                                  ScreenDetailInvoice(model: widget.model,isdonhang: true,);
                                },
                                textColor: Colors.white,
                                padding: 8
                          // },
                        )
                      : AnimatedTextKit(
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          pause: const Duration(milliseconds: 100),
                          animatedTexts: [
                              WavyAnimatedText(
                                  widget.model.trangThai == "0"
                                      ? "Đơn chờ xử lý..."
                                      : "Đơn đang xử lý...",
                                  textStyle:
                                      StyleApp.style500.copyWith(fontSize: 12))
                            ]))
        ],
      ),
    ).onTap(widget.ontap);
  }
}
