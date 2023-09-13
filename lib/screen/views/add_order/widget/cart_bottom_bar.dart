import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/params/param_create_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_invoice_hoadon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../config/style_app/color_app.dart';

class CartBottomBar extends StatefulWidget {
  ModelInvoice? invoice;
  List<HoadonItemsAdd>? items;
  CubitState? state;
  CreateHDParam param;

  CartBottomBar({this.invoice, this.items, this.state,required this.param});

  @override
  State<CartBottomBar> createState() => _CartBottomBarState();
}

class _CartBottomBarState extends State<CartBottomBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int TinhTien(){
    int tongtien = 0;
    for(var item in widget.items.validate()){
      tongtien += (item.giaSp ?? 1) * (item.soLuong ?? 1);
    }
    return tongtien;
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
              child: InkWell(
                  onTap: (){
                    if (widget.items.validate().isNotEmpty)
                      ScInvoiceHoaDon(
                        tongtien: TinhTien().validate(),
                        invoice: widget.invoice!,
                        items: widget.items!,
                        param: widget.param,
                      ).launch(context);
                    else
                      toast("Chưa có sản phầm trong đơn hàng");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorApp.text,
                    ),
                    child: Text("Xem Đơn Hàng",style: StyleApp.style600.copyWith(color: Colors.white,fontSize: 16),),
                  )
              ),
            ));
  }
}
