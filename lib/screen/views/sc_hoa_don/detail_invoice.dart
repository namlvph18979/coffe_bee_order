import 'package:coffe_bee_order/config/extention/int_ext.dart';

import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/detail_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_print_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/widget/item_invoice_product.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class ScreenDetailInvoice extends StatefulWidget {
  ModelInvoice model;
  bool isWatch;
  bool isdonhang;
  Function()? ontap;

  ScreenDetailInvoice(
      {required this.model,
      required this.isWatch,
      this.ontap,
      this.isdonhang = false});

  @override
  State<ScreenDetailInvoice> createState() => _ScreenDetailInvoiceState();
}

class _ScreenDetailInvoiceState extends State<ScreenDetailInvoice> {

  String timeIn = DateFormat("hh:mm a").format(DateTime.now());
  final invoiceBloc = DetailInvoiceBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailInvoiceBloc, CubitState>(
      bloc: invoiceBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: itemAppBar(
            title: "Hoá đơn bàn ${widget.model.idTable ?? ""}",
            align: false,
            isback: true,
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thông tin chi tiết",
                      style: StyleApp.style700
                          .copyWith(color: Colors.black, fontSize: 16),
                    ),
                    15.height,
                    itemText(title: "Hoá đơn số:  ", des: "${widget.model.idHoaDonCT}"),
                    8.height,
                    itemText(
                        title: "Tầng số:  ",
                        des: "1"),
                    8.height,
                    itemText(
                        title: "Bàn số:  ",
                        des: widget.model.idTable ?? "chưa cập nhật"),
                    8.height,
                    itemText(
                        title: "Tổng tiền:  ",
                        des: "${widget.model.tongTien!.toInt().toPrice()}đ"),
                    8.height,
                    itemText(
                        title: "Trạng thái:  ",
                        des: "Đã thanh toán"),
                    8.height,
                    itemText(
                        title: "Nv phụ trách:  ",
                        des: "${widget.model.fullname?.validate()}"),
                    20.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            "Giờ vào: ${widget.model.timeIn?.substring(0,5) ?? "Chưa cập nhật"}",
                            style: StyleApp.style400.copyWith(fontSize: 12)),
                        15.width,
                        Text(
                            "Giờ ra: ${timeIn?? "Chưa cập nhật"}",
                            style: StyleApp.style400.copyWith(fontSize: 12)),
                      ],
                    )
                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ItemInVoiceProduct(
                        model: widget.model.hoadonItems?[index],
                        isWatch: widget.isWatch,
                        onTap: () {
                          // setState(() {
                          //   widget.model.hoadonItems?.removeAt(index);
                          // });
                        },
                      ),
                  separatorBuilder: (context, index) => 1.height,
                  itemCount: widget.model.hoadonItems?.length ?? 0),
              70.height,
            ],
          ).scrollView(),
          bottomSheet: widget.model.trangThai == "0"
              ? const SizedBox()
              : Row(
                  children: [
                    !widget.isdonhang
                        ? itemButton(
                            textBtn: "Huỷ đơn",
                            onPress: () {
                                widget.model.hoadonItems?.clear();
                                widget.model.idTable = null;
                                widget.model.timeIn = null;
                              finish(context);
                              finish(context);
                            },
                          ).expand()
                        : const SizedBox(),
                    itemButton(
                      textBtn: "Thanh toán",
                      onPress: () {
                        if (widget.model.hoadonItems == []) {
                          toast("Chưa có sản phẩm cho đơn hàng");
                          return;
                        }
                        ScreenPrintinvoice(
                          model: widget.model,
                        ).launch(context);
                      },
                    ).expand(),
                  ],
                ),
        );
      },
    );
  }

  Widget itemText({String? title, String? des}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: title, style: StyleApp.style400.copyWith(color: Colors.black)),
      TextSpan(text: des, style: StyleApp.style400.copyWith(color: Colors.red)),
    ]));
  }
}
