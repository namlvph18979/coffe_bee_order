import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';
import '../../../../config/style_app/style_text.dart';

class itemOrderForPhaChe extends StatelessWidget {
  ModelInvoice model;
  Function()? ontap1;

  itemOrderForPhaChe({
    required this.model,
    this.ontap1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: ColorApp.text, width: 1)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Tầng: 1} - ",style: StyleApp.style700.copyWith(fontSize: 18),),
                    Text("Bàn số: ${model.idTable}",style: StyleApp.style700.copyWith(fontSize: 18),),
                  ],
                ),
                5.height,
                Text("Số lượng: ${model.hoadonItems!.length} món",style: StyleApp.style500.copyWith(color: Colors.red,fontSize: 12),),
                5.height,
                model.trangThai != "0"
                    ? Text("Trạng thái: Đã thanh toán",style: StyleApp.style500.copyWith(color: Colors.red,fontSize: 12),)
                    : Text("Trạng thái: Chưa thanh toán",style: StyleApp.style500.copyWith(color: Colors.red,fontSize: 12),),
                const Spacer(),
                Text("Giờ vào: ${model.timeIn}",style: StyleApp.style400.copyWith(fontSize: 11),),
              ],
            ).expand(flex: 4),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: 30,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorApp.text,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Text(
                    "Nhận đơn",
                    style: StyleApp.style600.copyWith(color: Colors.white,fontSize: 12),)
              ).onTap(ontap1),
            ),
          ],
        ));
  }
}
