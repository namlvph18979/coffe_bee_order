import 'package:audioplayers/audioplayers.dart';
import 'package:coffe_bee_order/screen/views/order/order_for_pha_che/sc_accept_order.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../data/remote_bloc/invoice/model_invoice.dart';
import '../../../../data/remote_bloc/product/product_model.dart';
import '../widget/item_all.dart';

List<ModelInvoice> listInvoiceTest = [
  ModelInvoice(
    id: 1,
    timeIn: "7:30 PM",
    price: 215000,
    listSp: listFake,
    type: 1,
    idTable: 1,
    idfloor: 1,

  ),
  ModelInvoice(
      id: 2,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 1,
      idTable: 2,
      idfloor: 1
  ),
  ModelInvoice(
      id: 3,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 3,
      idfloor: 2
  ),
  ModelInvoice(
      id: 4,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 4,
      idfloor: 3
  ),
  ModelInvoice(
      id: 5,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 5,
      idfloor: 1
  ),
  ModelInvoice(
      id: 6,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 1,
      idTable: 6,
      idfloor: 3
  ),
  ModelInvoice(
      id: 7,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 7,
      idfloor: 2
  ),

];
List<ModelPro> listFake= [];

class ScreenOrderForPhaChe extends StatefulWidget {
  const ScreenOrderForPhaChe({super.key});

  @override
  State<ScreenOrderForPhaChe> createState() => _ScreenOrderForPhaCheState();
}

class _ScreenOrderForPhaCheState extends State<ScreenOrderForPhaChe> {
  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return Scaffold(
      appBar: itemAppBar(
        title: "Đơn hàng chờ",
        align: true,
        isback: false,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ItemAll(
              model: listInvoiceTest[index],
              ontap1: () {
                ScreenAcceptOrder(
                    invoice: listInvoiceTest[index],
                    ontap: () {
                      player.play(AssetSource('sound/success_order.mp3'));
                      setState(() {
                        finish(context);
                        listInvoiceTest.removeAt(index);
                      });
                    },
                ).launch(context);
              },

          ),
          separatorBuilder: (context, index) => 20.height,
          itemCount: listInvoiceTest.length).paddingTop(15),
    );
  }
}
