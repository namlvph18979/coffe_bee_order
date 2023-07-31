import 'package:coffe_bee_order/data/remote_bloc/user/model/user_model.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/item_tabbar_auth.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/detail_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_print_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/widget/item_hoa_don.dart';
import 'package:coffe_bee_order/screen/widgets/dialog/confirm_dialog.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../data/remote_bloc/invoice/model_invoice.dart';
import '../../../data/remote_bloc/product/product_model.dart';

List<ModelPro> listFake= [];

List<ModelInvoice> listInvoice = [
  ModelInvoice(
      id: 1,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      listSp: listFake,
      type: 1,
      idTable: 1,
      idfloor: 1,
      isDone: true,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),
  ModelInvoice(
      id: 2,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      listSp: listFake,
      type: 1,
      idTable: 2,
      idfloor: 1,
      isDone: true,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),
  ModelInvoice(
      id: 3,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      listSp: listFake,
      type: 0,
      idTable: 3,
      idfloor: 2,
      isDone: true,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),
  ModelInvoice(
      id: 4,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      listSp: listFake,
      type: 0,
      idTable: 4,
      idfloor: 3,
      isDone: true,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),
  ModelInvoice(
      id: 5,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      listSp: listFake,
      type: 0,
      idTable: 5,
      idfloor: 1,
      isDone: true,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),
  ModelInvoice(
      id: 6,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      listSp: listFake,
      type: 1,
      idTable: 6,
      idfloor: 3,
      isDone: true,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),
  ModelInvoice(
      id: 7,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      listSp: listFake,
      type: 0,
      idTable: 7,
      idfloor: 2,
      isDone: true,
      user: UserModel(idUser: '1', userName: "Nam lv", passwd: "12345", phoneNumber: "123456789", chucNang: "Nhân Viên")  ),

];

class Screeninvoice extends StatefulWidget {

  ModelInvoice? model;

  Screeninvoice({this.model});

  @override
  State<Screeninvoice> createState() => _ScreeninvoiceState();
}


class _ScreeninvoiceState extends State<Screeninvoice> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
          title: "Hoá đơn",
          isback: false,
          align: true),
      body: ItemTabbarAuth(
          length: 3,
          listTap: const [
            Tab(text: "Tầng 1",height: 40,),
            Tab(text: "Tầng 2",height: 40,),
            Tab(text: "Tầng 3",height: 40,),
          ],
          listTapBarView: [
            Tab1(),
            Tab1(),
            Tab1(),
          ]),
    );
  }

  Widget Tab1(){
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => ItemHoaDon(
            model: listInvoice[index],
            isdonhang: true,
            ontap1: (){
              ScreenPrintinvoice(
                  model: listInvoice[index]
              ).launch(context).then((value) {
                if (value != null){
                  setState(() {
                    listInvoice[index].type = value;
                  });
                }
                return;
              });
            },
            ontap2: () {
              showInDialog(
                context,
                dialogAnimation: DialogAnimation.SCALE,
                transitionDuration: const Duration(milliseconds: 250),
                builder: (p0) => ConfirmDialog(
                    ontap1: (){
                      finish(context);},
                    ontap2: () {
                      setState(() {
                        if(listInvoice[index].type == 0){
                          toast("Hóa đơn chưa được thanh toán");
                        }else{
                          listInvoice.removeAt(index);
                          finish(context);
                        }

                    });},
                    title: "Đóng Bàn",
                    des: "Bạn xác nhận đóng bàn."
                        " Khi đã đóng bàn sẽ không thể khôi phục được dữ liệu."),
              );
            },
            ontap3: (){
              ScreenDetailInvoice(
                  model: listInvoice[index],
                  isWatch: true,
                  isdonhang: true,
              ).launch(context);
            },
        ),
        separatorBuilder: (context, index) => 1.height,
        itemCount: listInvoice.length
    );
  }
}
