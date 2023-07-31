import 'package:coffe_bee_order/screen/views/sc_hoa_don/detail_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/widget/item_hoa_don.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../data/remote_bloc/invoice/model_invoice.dart';
import '../../../../data/remote_bloc/product/product_model.dart';
import '../../../../data/remote_bloc/user/model/user_model.dart';

List<ModelInvoice> listInvoiceTest = [
  ModelInvoice(
      id: 1,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 1,
      idTable: 1,
      idfloor: 1,
      isDone: true,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")

  ),
  ModelInvoice(
      id: 2,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 1,
      idTable: 2,
      idfloor: 1,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),
  ModelInvoice(
      id: 3,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 3,
      idfloor: 2,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),
  ModelInvoice(
      id: 4,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 4,
      idfloor: 3,
      isDone: true,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),
  ModelInvoice(
      id: 5,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 5,
      idfloor: 1,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),
  ModelInvoice(
      id: 6,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 1,
      idTable: 6,
      idfloor: 3,
      isDone: true,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),
  ModelInvoice(
      id: 7,
      timeIn: "7:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 7,
      idfloor: 2,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),

];
List<ModelPro> listFake= [];


class ScreenOrder extends StatefulWidget {
  const ScreenOrder({super.key});

  @override
  State<ScreenOrder> createState() => _ScreenOrderState();
}

class _ScreenOrderState extends State<ScreenOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
          title: "Đơn hàng",
          align: true),
      body: ListView.separated(
          itemBuilder: (context, index) => ItemHoaDon(
              model: listInvoiceTest[index],
              ontap3: () {
                ScreenDetailInvoice(
                    model: listInvoiceTest[index],
                    isWatch: true,
                    isdonhang: true,
                ).launch(context);
              },
              ontap4: () {setState(() => listInvoiceTest.removeAt(index));},
          ),
          separatorBuilder: (context, index) => 1.height,
          itemCount: listInvoiceTest.length),
    );
  }
}
