import 'package:coffe_bee_order/data/remote_bloc/user/user_model.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/item_tabbar_auth.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/detail_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_print_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/widget/item_hoa_don.dart';
import 'package:coffe_bee_order/screen/widgets/dialog/confirm_dialog.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../data/remote_bloc/invoice/model_invoice.dart';
import '../../../data/remote_bloc/product_model.dart';

List<ModelPro> listFake= [
  ModelPro(
      id: 1,
      idCat: 5,
      name: "Kem dâu",
      imageUrl: "https://static.hotdeal.vn/images/695/694824/500x500/146677-ngay-hoi-kem-tuoi-an-kem-thoa-thich-tai-halloween-ice-cream.jpg",
      price: 250000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 2,
      idCat: 5,
      name: "Kem dâu",
      imageUrl: "https://static.hotdeal.vn/images/695/694824/500x500/146677-ngay-hoi-kem-tuoi-an-kem-thoa-thich-tai-halloween-ice-cream.jpg",
      price: 250000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 3,
      idCat: 4,
      name: "Bim bim Socola",
      imageUrl: "https://cf.shopee.vn/file/821b6cea5112d420911211eb563aaa28",
      price: 30000,
      discountPercent: 30,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
          "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
          "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
          "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
          "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 4,
      idCat: 4,
      name: "Bim bim gà",
      imageUrl: "https://cf.shopee.vn/file/821b6cea5112d420911211eb563aaa28",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."

  ),
  ModelPro(
      id: 5,
      idCat: 1,
      name: "Trà sữa kít",
      imageUrl: "https://phuongnamvina.com/img_data/images/mo-quan-tra-sua-can-nhung-gi-12-buoc-mo-quan-tra-sua-thanh-cong.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."

  ),
  ModelPro(
      id: 5,
      idCat: 1,
      name: "Trà sữa Ô long",
      imageUrl: "https://phuongnamvina.com/img_data/images/mo-quan-tra-sua-can-nhung-gi-12-buoc-mo-quan-tra-sua-thanh-cong.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."

  ),

];

List<ModelInvoice> listInvoice = [
  ModelInvoice(
      id: 1,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      price: 215000,
      listSp: listFake,
      type: 1,
      idTable: 1,
      idfloor: 1,
      isDone: true,
      user: UserModel(id: 1, userName: "Nam lv0", passWord: "12345", phoneNumber: "123456789", Type: 0)
  ),
  ModelInvoice(
      id: 2,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      price: 215000,
      listSp: listFake,
      type: 1,
      idTable: 2,
      idfloor: 1,
      isDone: true,
      user: UserModel(id: 1, userName: "Nam lv1", passWord: "12345", phoneNumber: "123456789", Type: 0)
  ),
  ModelInvoice(
      id: 3,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 3,
      idfloor: 2,
      isDone: true,
      user: UserModel(id: 1, userName: "Nam lv2", passWord: "12345", phoneNumber: "123456789", Type: 0)
  ),
  ModelInvoice(
      id: 4,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 4,
      idfloor: 3,
      isDone: true,
      user: UserModel(id: 1, userName: "Nam lv3", passWord: "12345", phoneNumber: "123456789", Type: 0)
  ),
  ModelInvoice(
      id: 5,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 5,
      idfloor: 1,
      isDone: true,
      user: UserModel(id: 1, userName: "Nam lv4", passWord: "12345", phoneNumber: "123456789", Type: 0)
  ),
  ModelInvoice(
      id: 6,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      price: 215000,
      listSp: listFake,
      type: 1,
      idTable: 6,
      idfloor: 3,
      isDone: true,
      user: UserModel(id: 1, userName: "Nam lv5", passWord: "12345", phoneNumber: "123456789", Type: 0)
  ),
  ModelInvoice(
      id: 7,
      timeIn: "7:30 PM",
      timeout: "9:30 PM",
      price: 215000,
      listSp: listFake,
      type: 0,
      idTable: 7,
      idfloor: 2,
      isDone: true,
      user: UserModel(id: 1, userName: "Nam lv6", passWord: "12345", phoneNumber: "123456789", Type: 0)
  ),

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
              ScreenPrintinvoice(model: listInvoice[index]).launch(context);
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
