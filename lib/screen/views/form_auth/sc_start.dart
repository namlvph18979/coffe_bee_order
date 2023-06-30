import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/image_path.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/item_type_login.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';


List<itemTypeLogin> listType =[
  itemTypeLogin(
      imageUrl: "https://blog.dktcdn.net/files/istockphoto-1198944463-612x612.jpg",
      title: "Nhân Viên"),
  itemTypeLogin(
      imageUrl: "https://chefjob.vn/wp-content/uploads/2019/01/nhan-vien-thu-ngan-nha-hang-khach-san.jpg",
      title: "Thu ngân"),
  itemTypeLogin(
      imageUrl: "https://caphenguyenchat.vn/wp-content/uploads/2020/02/cach-quan-ly-quan-ca-phe-hieu-qua-3.jpg",
      title: "Pha Chế"),
];

class ScreenStart extends StatefulWidget {
  const ScreenStart({super.key});

  @override
  State<ScreenStart> createState() => _ScreenStartState();
}

class _ScreenStartState extends State<ScreenStart> {

  String tdata = DateFormat("hh:mm a").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          50.height,
          Image.asset(ImagePath.logo,height: 180),
          10.height,
          Text(
            "Coffee Bee Order".toUpperCase(),
            style : StyleApp.style800.copyWith(fontSize: 25,wordSpacing: 6,letterSpacing: 3),),
          30.height,
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => itemTypeLogin(
                  imageUrl: listType[index].imageUrl,
                  title: listType[index].title),
              separatorBuilder: (context, index) => 15.height,
              itemCount: listType.length),
        ],
      ).scrollView(),
      bottomSheet: Text(
          tdata,
        style: StyleApp.style500.copyWith(
            fontSize: 16),
          textAlign: TextAlign.center
      ).withWidth(MediaQuery.of(context).size.width).paddingBottom(15),
    );
  }
}
