import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/check_state.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/widget/item_invoice_product.dart';
import 'package:coffe_bee_order/screen/widgets/custom_button.dart';
import 'package:coffe_bee_order/screen/widgets/dialog/confirm_dialog.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class ScreenDetailInvoice extends StatefulWidget {
  ModelInvoice model;
  bool isdonhang;

  ScreenDetailInvoice({required this.model, this.isdonhang = false});

  @override
  State<ScreenDetailInvoice> createState() => _ScreenDetailInvoiceState();
}

class _ScreenDetailInvoiceState extends State<ScreenDetailInvoice> {
  String timeIn = DateFormat("hh:mm a").format(DateTime.now());

  final bloc = ListInvoiceBloc();

  closeTb() {
    bloc.CloseTable(id: widget.model.idHoaDonCT);
  }

  acceptOrder() {
    bloc.updateTTDon(id: widget.model.idHoaDonCT,trangThai: "3");
    context.read<ListInvoiceBloc>()..getListDone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: itemAppBar(
          title: widget.model.idTable != null ? "Hoá đơn bàn ${widget.model.idTable ?? ""}" : "Đơn mang đi số ${widget.model.idHoaDonCT}",
          align: false,
          isback: true,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thông tin chi tiết",
                    style: StyleApp.style700
                        .copyWith(color: Colors.black, fontSize: 16),
                  ),
                  15.height,
                  itemText(
                      title: "Hoá đơn số:  ",
                      des: "${widget.model.idHoaDonCT}"),
                  8.height,
                  if(widget.model.idTable != null)...[
                    itemText(
                        title: "Bàn số:  ",
                        des: widget.model.idTable ?? "chưa cập nhật"),
                    8.height,
                    itemText(title: "Tầng số:  ", des: "1"),
                  ]
                  else
                    itemText(
                        title: "Loại đơn:  ",
                        des: "Đơn mang đi"),
                  8.height,
                  itemText(
                      title: "Tổng tiền:  ",
                      des: "${widget.model.tongTien!.toInt().toPrice()}đ"),
                  8.height,
                  itemText(title: "Trạng thái:  ", des: "Đã thanh toán"),
                  8.height,
                  itemText(
                      title: "Nv phụ trách:  ",
                      des: "${widget.model.fullname?.validate()}"),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          "Giờ vào: ${widget.model.timeIn?.substring(0, 5) ?? "Chưa cập nhật"}",
                          style: StyleApp.style400.copyWith(fontSize: 12)),
                      15.width,
                      Text("Giờ ra: ${widget.model.timeOut}",
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
                      onTap: () {
                        setState(() {
                          widget.model.hoadonItems?.removeAt(index);
                        });
                      },
                    ),
                separatorBuilder: (context, index) => 1.height,
                itemCount: widget.model.hoadonItems?.length ?? 0),
            70.height,
          ],
        ).scrollView(),
        bottomSheet: !widget.isdonhang
            ? BlocConsumer<ListInvoiceBloc, CubitState>(
                bloc: bloc,
                listener: (context, state) {
                  CheckStateBloc.checkNoLoad(
                    context,
                    state,
                    success: () {
                      toast("Đóng bàn thành công");
                    },
                  );
                },
                builder: (context, state) => CustomButton(
                  title: "Đóng bàn",
                  isLoad: state.status == BlocStatus.loading,
                  onTap: () {
                    showInDialog(
                      context,
                      builder: (p0) => ConfirmDialog(
                        title: "Thông báo",
                        des:
                            "Xác nhận đóng bàn mọi thông tin sẽ biến mất và bàn sẽ quay về trạng thái để trống",
                        ontap1: () {
                          finish(context);
                        },
                        ontap2: () {
                          closeTb();
                          context.read<ListInvoiceBloc>()..getListDone();
                          finish(context);
                          finish(context);
                        },
                      ),
                    );
                  },
                  padding: 12,
                ).withWidth(double.infinity).paddingAll(10),
              )
            : widget.model.trangThai == "2"
                ? BlocConsumer<ListInvoiceBloc, CubitState>(
                     bloc: bloc,
                    listener: (context, state) {
                      CheckStateBloc.checkNoLoad(
                        context,
                        state,
                        msg: state.msg,
                        success: () {
                          context.read<ListInvoiceBloc>()..getListDone();
                          context.read<ListInvoiceBloc>()..getListTT012();
                          toast("Nhận đơn thành công");
                          finish(context);
                          setState(() {});
                        },
                      );
                    },
                    builder: (context, state) => CustomButton(
                      title: "Nhận đơn",
                      isLoad: state.status == BlocStatus.loading,
                      onTap: acceptOrder
                    ).withWidth(double.infinity).paddingAll(10),
                  )
                : Container(
                    color: ColorApp.bg,
                    child: AnimatedTextKit(
                            isRepeatingAnimation: true,
                            repeatForever: true,
                            pause: const Duration(milliseconds: 100),
                            animatedTexts: [
                          WavyAnimatedText(
                              widget.model.trangThai == "0"
                                  ? "Đơn chờ xử lý..."
                                  : "Đơn đang xử lý...",
                              textStyle:
                                  StyleApp.style600.copyWith(fontSize: 16))
                        ])
                        .withWidth(double.infinity)
                        .paddingSymmetric(vertical: 15, horizontal: 10),
                  ));
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
