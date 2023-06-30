import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/data/remote_bloc/nguyenlieu/nguyenlieu_model.dart';
import 'package:coffe_bee_order/screen/views/sc_nguyen_lieu/widget/bottom_sheet_add_nl.dart';
import 'package:coffe_bee_order/screen/views/sc_nguyen_lieu/widget/item_nguyenlieu.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

List<ModelNL> listTest = [
  ModelNL(id: 1,imgUrl: "https://thesaigontimes.vn/wp-content/uploads/2022/07/Dungdequatre.jpeg.jpg", name: "hạt Cà phê đen",price: 30000,type: "kg"),
  ModelNL(id: 2, name: "Bột Cacao",soluong: 15,type: "kg"),
  ModelNL(id: 3,imgUrl: "https://www.huongnghiepaau.com/wp-content/uploads/2017/05/chon-bot-matcha-chat-luong.jpg", name: "Bột Matcha",price: 30000,soluong: 2,type: "kg"),
  ModelNL(id: 4,imgUrl: "https://ptaste.vn/wp-content/uploads/2020/08/sua-tuoi-nguyen-kem-binda-valley-Uc_new.jpg", name: "Sữa tươi",price: 30000,soluong: 18,type: "hộp"),
  ModelNL(id: 5,imgUrl: "https://cdn.tgdd.vn/Files/2018/04/22/1083831/thuc-hu-viec-tam-bang-la-khien-da-be-bi-den-1_800x450.jpg", name: "Lá trà",price: 30000,type: "túi"),
  ModelNL(id: 6,imgUrl: "https://suatuoisach.koz.vn/wp-content/uploads/2023/05/sua-dac-Promex-lon-1kg-nhap-khau-Malaysia.jpg", name: "Sữa đặc",price: 30000,soluong: 3,type: "hộp"),
  ModelNL(id: 7,imgUrl: "https://bizweb.dktcdn.net/100/315/482/products/watermarked-bao.jpg?v=1550824681230", name: "Bột trà sữa",price: 30000,type: "kg"),
  ModelNL(id: 8,imgUrl: "https://vinmec-prod.s3.amazonaws.com/images/20191125_074902_583796_can-sa-1.max-1800x1800.jpg", name: "Cấn là",price: 1200000,type: "lá"),
];

class ScreenNguyenlieu extends StatefulWidget {
  const ScreenNguyenlieu({super.key});

  @override
  State<ScreenNguyenlieu> createState() => _ScreenNguyenlieuState();
}

class _ScreenNguyenlieuState extends State<ScreenNguyenlieu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
          title: "Nguyên liệu",
          align: true,
          isback: false,
          actions: [
           const Icon(
               Icons.add_circle_outline,
               color: Colors.white)
               .paddingOnly(right: 10)
               .onTap((){
                 showModalBottomSheet(
                     context: context,
                     builder: (context) => bottomChooseNl(
                       list: listTest,
                     ),
                     isScrollControlled: true,
                     shape: const OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white),
                         borderRadius:
                         BorderRadius.vertical(top: Radius.circular(20)))
                 );
           })
        ],
      ),
      body: Column(
        children: [
            GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(
                    listTest.length,
                    (index) => ItemNguyenLieu(
                        model: listTest[index]
                    ))
            )
        ],
      ).scrollView(),
    );
  }
}
