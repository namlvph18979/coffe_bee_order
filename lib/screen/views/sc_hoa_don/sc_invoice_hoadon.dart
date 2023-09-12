import 'dart:ffi';

import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_print_invoice.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ScInvoiceHoaDon extends StatefulWidget {

  ModelInvoice? invoice;
  List<HoadonItemsAdd>? items;

  ScInvoiceHoaDon({this.invoice,this.items});

  @override
  State<ScInvoiceHoaDon> createState() => _ScInvoiceHoaDonState();
}

class _ScInvoiceHoaDonState extends State<ScInvoiceHoaDon> {

  int tien = 0;

  @override
  void initState() {
    TinhTien;
    super.initState();
    print("#####scInvoice######${widget.items?[0].tenSp}");
    print("#####scInvoice######${widget.items?[0].soLuong}");
    print("#####scInvoice######${widget.items?[0].giaSp}");

  }
  TinhTien(){
    for(int i = 0;i <= widget.items!.length; i++){
      tien += (widget.items?[i].giaSp).toInt() * (widget.items?[i].soLuong).toInt();
    }
    return tien;
  }


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
                    des: "${tien.toPrice()}đ"),
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
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tên:  ${widget.items?[index].tenSp.validate()}",style: StyleApp.style600.copyWith(fontSize: 14,color: ColorApp.text),maxLines: 1,overflow: TextOverflow.ellipsis,),
                    Text("SL:  ${widget.items?[index].soLuong.validate()}",style: StyleApp.style600.copyWith(fontSize: 14,color: ColorApp.text),),
                    Text("Giá:  ${widget.items?[index].giaSp?.toInt().toPrice()}đ",style: StyleApp.style600.copyWith(fontSize: 14,color: ColorApp.text),),
                    widget.items![index].ghiChu.validate().isNotEmpty
                        ? Text("${widget.items![index].ghiChu.validate(value: "")}",style: StyleApp.style600.copyWith(fontSize: 14,color: ColorApp.text),)
                        : const SizedBox()
                  ],
                ),
              ),
              separatorBuilder: (context, index) => 8.height,
              itemCount: widget.items?.length ?? 0),
          70.height,
        ],
      ).scrollView(),
      bottomSheet: Row(
        children: [
           itemButton(
            textBtn: "Huỷ đơn",
            onPress: () {
              widget.invoice?.hoadonItems?.clear();
              widget.invoice?.idTable = null;
              widget.invoice?.timeIn = null;
              finish(context);
              finish(context);
            },
          ).expand(),
          itemButton(
            textBtn: "Thanh toán",
            onPress: () {
              if (widget.invoice?.hoadonItems == []) {
                toast("Chưa có sản phẩm cho đơn hàng");
                return;
              }
              ScreenPrintinvoice(
                model: widget.invoice!,
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
