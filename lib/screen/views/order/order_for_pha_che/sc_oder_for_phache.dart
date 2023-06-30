import 'package:audioplayers/audioplayers.dart';
import 'package:coffe_bee_order/screen/views/order/order_for_pha_che/sc_accept_order.dart';
import 'package:coffe_bee_order/screen/views/order/widget/item_order_for_phache.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../data/remote_bloc/invoice/model_invoice.dart';
import '../../../../data/remote_bloc/product_model.dart';
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
List<ModelPro> listFake= [
  ModelPro(
      id: 1,
      idCat: 5,
      name: "Kem dâu",
      imageUrl: "https://static.hotdeal.vn/images/695/694824/500x500/146677-ngay-hoi-kem-tuoi-an-kem-thoa-thich-tai-halloween-ice-cream.jpg",
      price: 250000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.",
      note: "Lấy kem không được lạnh"
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
          "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.",
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
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.",
      note: "Xin thêm 2 cân đường mang về"

  ),
  ModelPro(
      id: 5,
      idCat: 1,
      name: "Trà sữa Ô long",
      imageUrl: "https://phuongnamvina.com/img_data/images/mo-quan-tra-sua-can-nhung-gi-12-buoc-mo-quan-tra-sua-thanh-cong.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.",
      note: "Thay olong bằng thanh long nhá!"
  ),

];

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
