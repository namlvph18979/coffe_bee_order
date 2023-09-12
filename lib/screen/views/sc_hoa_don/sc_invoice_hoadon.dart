import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'widget/item_invoice_product.dart';

class ScInvoiceHoaDon extends StatefulWidget {

  ModelInvoice? invoice;
  List<HoadonItemsAdd>? items;
  int? tongtien;
  ScInvoiceHoaDon({this.invoice,this.items,this.tongtien});

  @override
  State<ScInvoiceHoaDon> createState() => _ScInvoiceHoaDonState();
}

class _ScInvoiceHoaDonState extends State<ScInvoiceHoaDon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
        title: "Hoá đơn bàn ${widget.invoice?.idTable ?? ""}",
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
                itemText(
                    title: "Tầng số:  ",
                    des: "1"),
                8.height,
                itemText(
                    title: "Bàn số:  ",
                    des: widget.invoice?.idTable ?? "chưa cập nhật"),
                8.height,
                itemText(
                    title: "Tổng tiền:  ",
                    des: "${widget.tongtien?.toPrice()}đ"),
                8.height,
                itemText(
                    title: "Trạng thái:  ",
                    des: "Chưa thanh toán"),
                8.height,
                itemText(
                    title: "Nv phụ trách:  ",
                    des: "${widget.invoice?.fullname.validate()}"),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Giờ vào: ${widget.invoice?.timeIn.validate() ?? "Chưa cập nhật"}",
                        style: StyleApp.style400.copyWith(fontSize: 12)),
                    15.width,
                    Text(
                        "Giờ ra: Chưa cập nhật",
                        style: StyleApp.style400.copyWith(fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          widget.items!.isNotEmpty ? ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                  ],
                ),
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
