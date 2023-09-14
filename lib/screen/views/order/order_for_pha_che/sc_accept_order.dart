
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
          title: "Đơn Bàn số ${invoice.idTable} - Tầng 1",
          isback: false,
          align: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) =>  itemfr(
              text: invoice.hoadonItems?[index].tenSp,
              sl: invoice.hoadonItems?[index].soLuong,
              note: invoice.hoadonItems![index].ghiChu
          ),
          separatorBuilder: (context, index) => 15.height,
          itemCount: invoice.hoadonItems!.length
      ).paddingSymmetric(horizontal: 10,vertical: 15),
      bottomSheet: itemButton(
          textBtn: "Hoàn thành đơn".toUpperCase(),
          onPress: ontap,
      ),
    );
  }

  Widget itemfr({
     required String? text,
    String? sl,
    String? note})
  {
    return Container(

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
                  Text("SL: ×$sl",style: StyleApp.style600,).expand(flex: 1)
            ],
          ),
          note != null
          ? Text("Lưu ý: $note",style: StyleApp.style400,maxLines: 10,overflow: TextOverflow.ellipsis,).paddingTop(10)
          : const SizedBox()
        ],
      ),
    );
  }

}
