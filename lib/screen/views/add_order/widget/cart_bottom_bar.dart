import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/detail_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_invoice_hoadon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../config/style_app/color_app.dart';

class CartBottomBar extends StatefulWidget {

  Function()? send;
  ModelInvoice? invoice;
  List<HoadonItemsAdd>? items;

  CartBottomBar({this.send, this.invoice,this.items});

  @override
  State<CartBottomBar> createState() => _CartBottomBarState();
}

class _CartBottomBarState extends State<CartBottomBar> {

  int tien = 0;

  tongtien(){
    if(widget.items != null){
      for(int i = 0;i <= widget.items!.length; i++){
        tien = widget.items![i].giaSp.toInt() * widget.items![i].soLuong.toInt();
      }
      return tien;
    }else {
      return 0;
    }

  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
              height: 50,
              margin: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(width: 1.5, color: ColorApp.text)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  10.width,
                  Badge.count(
                      count: 0,
                      isLabelVisible: false,
                      textStyle: StyleApp.style400.copyWith(
                        fontSize: 10, color: Colors.white),
                    padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    alignment: const AlignmentDirectional(15, -5),
                    child: const Icon(
                      CupertinoIcons.shopping_cart,
                      color: ColorApp.text,
                    ),
                  ),
                  Text(
                    "Tổng: ${tongtien()}",
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
                      style: StyleApp.style700
                          .copyWith(color: Colors.white),
                    ),
                  ).onTap(widget.send).expand(flex: 2)
                ],
              ),
            ).onTap(() {
                ScInvoiceHoaDon(
                invoice: widget.invoice!,
                items: widget.items,
                  tongtien: tongtien(),
              ).launch(context);
            }));
  }
}
