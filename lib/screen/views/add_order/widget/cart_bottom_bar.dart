
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/detail_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_print_invoice.dart';
import 'package:coffe_bee_order/screen/widgets/dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../config/style_app/color_app.dart';

class CartBottomBar extends StatefulWidget {

  ModelInvoice? model;

  CartBottomBar({this.model});

  @override
  State<CartBottomBar> createState() => _CartBottomBarState();
}

class _CartBottomBarState extends State<CartBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder:(context) => Container(
          height: 50,
          margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1.5,color: ColorApp.text)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.shopping_cart_rounded,color: ColorApp.text,size: 28,),
                  Positioned(
                      top: 0,
                      left: 32,
                      child: Container(
                        width: 15,
                        height: 13,
                        alignment: Alignment.center,
                        decoration:const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle
                        ),
                        child: Text(
                          "${widget.model!.listSp!.length}",
                          style: StyleApp.style500.copyWith(color: Colors.white,fontSize: 8),),
                      )
                  )
                ],
              ).expand(flex: 1),
              Text("Tổng: ${widget.model!.price}",style: StyleApp.style600.copyWith(
                  color: Colors.red),textAlign: TextAlign.center,
              ).expand(flex: 4),
              Container(
                color: ColorApp.text,
                height: double.infinity,
                alignment: Alignment.center,
                child: Text("Xác Nhận",style: StyleApp.style700.copyWith(color: Colors.white),),
              ).onTap((){
                showInDialog(
                  context,
                  builder: (p0) => ConfirmDialog(
                      title: "Thanh toán",
                      des: "Vui lòng chọn kiểu thanh toán",
                      text1: "Trước",
                      text2: "Sau",
                      ontap1: () {
                        finish(context);
                        ScreenPrintinvoice(model: widget.model!).launch(context);
                      },
                      ontap2: () {
                        finish(context);
                        toast("Gửi đơn thành công",bgColor: ColorApp.text);
                      },
                  ));

              }).expand(flex: 2)
            ],
          ),
        ).onTap((){
          ScreenDetailInvoice(
              model: widget.model!,
              isWatch: false,
          ).launch(context);
        })
    );
  }
}
