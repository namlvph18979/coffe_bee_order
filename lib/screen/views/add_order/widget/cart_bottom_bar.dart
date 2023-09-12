import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/check_state.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_invoice_hoadon.dart';
import 'package:coffe_bee_order/screen/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                      count: widget.items?.length.validate() ?? 0,
                      isLabelVisible: false,
                      textStyle: StyleApp.style400.copyWith(
                        fontSize: 10, color: Colors.white),
                    padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: const Icon(
                      CupertinoIcons.shopping_cart,
                      color: ColorApp.text,
                    ),
                  ),
                  Text(
                    "Xem hóa đơn",
                    style:
                        StyleApp.style600.copyWith(color: Colors.red),
                    textAlign: TextAlign.center,
                  ).expand(flex: 4),
                  CustomButton(
                      title: "Xac Nhan",
                      color: ColorApp.text,
                      onTap: widget.send,
                      textColor: Colors.white,

                  ).expand(flex: 2)
                ],
              ),
            ).onTap(() {
              print("#############${widget.items?[0].tenSp}");
                ScInvoiceHoaDon(
                invoice: widget.invoice!,
                items: widget.items,
              ).launch(context);
            }));
  }
}
