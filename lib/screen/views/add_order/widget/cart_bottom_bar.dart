import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_invoice_hoadon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../config/style_app/color_app.dart';

class CartBottomBar extends StatefulWidget {
  CartBottomBar();

  @override
  State<CartBottomBar> createState() => _CartBottomBarState();
}

class _CartBottomBarState extends State<CartBottomBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ListInvoiceBloc>()..addCart();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.5, color: ColorApp.text)),
            child: Row(
              children: [
                10.width,
                Badge.count(
                  count: context.watch<ListInvoiceBloc>().count,
                  isLabelVisible:
                      context.watch<ListInvoiceBloc>().items.isNotEmpty,
                  textStyle: StyleApp.style400
                      .copyWith(fontSize: 10, color: Colors.white),
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  alignment: const AlignmentDirectional(15, -5),
                  child: const Icon(
                    CupertinoIcons.shopping_cart,
                    color: ColorApp.text,
                  ),
                ).expand(flex: 1),
                Text(
                  "Tổng: ${context.watch<ListInvoiceBloc>().total.toPrice()}đ",
                  style: StyleApp.style600.copyWith(color: Colors.red),
                  textAlign: TextAlign.center,
                ).expand(flex: 4),
                Container(
                  color: ColorApp.text,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Xác Nhận",
                    style: StyleApp.style700.copyWith(color: Colors.white),
                  ),
                ).expand(flex: 2)
              ],
            ).onTap(
              () {
                if (context.read<ListInvoiceBloc>().items.isNotEmpty)
                  ScInvoiceHoaDon().launch(context);
                else
                  toast("Chưa thêm sản phẩm");
              },
            )));
  }
}
