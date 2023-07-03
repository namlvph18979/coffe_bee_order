import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/detail_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/add_order/sc_create_order.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/detail_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_print_invoice.dart';
import 'package:coffe_bee_order/screen/widgets/dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../config/style_app/color_app.dart';

class CartBottomBar extends StatefulWidget {
  ModelInvoice? model;

  CartBottomBar({this.model});

  @override
  State<CartBottomBar> createState() => _CartBottomBarState();
}

class _CartBottomBarState extends State<CartBottomBar>{
  final invoiceBloc = DetailInvoiceBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailInvoiceBloc, CubitState>(
      bloc: invoiceBloc,
      builder: (context, state) {
        int count = 0;
        int priceAll = 0;
        for (int i = 0; i < widget.model!.listSp!.length; i++) {
          if (widget.model!.listSp![i].discountPercent != null) {
            priceAll += ((widget.model!.listSp![i].price * widget.model!.listSp![i].soluong)
                * (100 - widget.model!.listSp![i].discountPercent!) ~/ 100);
          } else {
            priceAll += (widget.model!.listSp![i].price * widget.model!.listSp![i].soluong);
          }
          count += widget.model!.listSp![i].soluong;
        }
        return BottomSheet(
            onClosing: () {},
            builder: (context) => Container(
                  height: 50,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1.5, color: ColorApp.text)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_cart_rounded,
                            color: ColorApp.text,
                            size: 28,
                          ),
                          Positioned(
                              top: 0,
                              left: 32,
                              child: Container(
                                width: 15,
                                height: 13,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle),
                                child: Text(
                                  "$count",
                                  style: StyleApp.style500.copyWith(
                                      color: Colors.white, fontSize: 8),
                                ),
                              ))
                        ],
                      ).expand(flex: 1),
                      Text(
                        "Tổng: ${priceAll.toPrice()}đ",
                        style:
                            StyleApp.style600.copyWith(color: Colors.red),
                        textAlign: TextAlign.center,
                      ).expand(flex: 4),
                      Container(
                        color: ColorApp.text,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "Xác Nhận",
                          style:
                              StyleApp.style700.copyWith(color: Colors.white),
                        ),
                      ).onTap(() {
                        if (widget.model!.listSp!.isEmpty) {
                          toast("Chưa có sản phẩm nào");
                          return;
                        }
                        showInDialog(context,
                            builder: (p0) => ConfirmDialog(
                                  title: "Thanh toán",
                                  des: "Vui lòng chọn kiểu thanh toán",
                                  text1: "Trước",
                                  text2: "Sau",
                                  ontap1: () {
                                    finish(context);
                                    ScreenPrintinvoice(model: widget.model!)
                                        .launch(context);
                                  },
                                  ontap2: () {
                                    finish(context);
                                    finish(context);
                                    modelInvoice.listSp!.clear();
                                    modelInvoice.idfloor == null;
                                    modelInvoice.idTable == null;
                                    modelInvoice.timeIn == null;

                                    toast("Gửi đơn thành công",
                                        bgColor: ColorApp.text);
                                  },
                                ));
                      }).expand(flex: 2)
                    ],
                  ),
                ).onTap(() {
                  ScreenDetailInvoice(
                    model: widget.model!,
                    isWatch: false,
                  ).launch(context);
                }));
      },
    );
  }
}
