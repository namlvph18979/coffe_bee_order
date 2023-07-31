
import 'package:audioplayers/audioplayers.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';

class ScreenAcceptOrder extends StatelessWidget {

  ModelInvoice invoice;
  Function()? ontap;

  ScreenAcceptOrder({required this.invoice,this.ontap});


  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return Scaffold(
      appBar: itemAppBar(
          title: "Đơn Bàn số ${invoice.idTable} - Tầng ${invoice.idfloor}",
          isback: false,
          align: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) =>  itemfr(
              text: invoice.listSp![index].tenSp,
              sl: invoice.listSp![index].soluong,
              note: invoice.listSp![index].note
          ),
          separatorBuilder: (context, index) => 15.height,
          itemCount: invoice.listSp!.length
      ).paddingSymmetric(horizontal: 10,vertical: 15),
      bottomSheet: itemButton(
          textBtn: "Hoàn thành đơn".toUpperCase(),
          onPress: ontap,
      ),
    );
  }

  Widget itemfr({
     required String? text,
     required int? sl,
    String? note})
  {
    return Container(
      height: 60,
      padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorApp.text,width: 1),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                  Text("$text",style: StyleApp.style600.copyWith(fontSize: 15),).expand(flex: 3),
                  Text("SL: ×$sl",style: StyleApp.style500,).expand(flex: 1)
            ],
          ),
          note != null
          ? Text("Lưu ý: $note",style: StyleApp.style400,).paddingTop(10)
          : const SizedBox()
        ],
      ),
    );
  }

}
