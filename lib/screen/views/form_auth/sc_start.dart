import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/image_path.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/item_type_login.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

List<itemTypeLogin> listType = [
  itemTypeLogin(
      type: "1",
      imageUrl:
          "https://vn.joboko.com/blogs/img/2020/2/nhan-vien-pha-che-3.jpg",
      title: "Nhân Viên"),
  itemTypeLogin(
      type: "2",
      imageUrl:
          "https://images.careerbuilder.vn/content/images/ky-nang-nhan-vien-thu-ngan-careerbuilder.jpg",
      title: "Thu Ngân"),
  itemTypeLogin(
      type: "3",
      imageUrl:
          "https://epicure.vn/wp-content/uploads/2017/08/cafe-capuchino-02-1.jpg",
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
          Image.asset(ImagePath.logo, height: 180),
          10.height,
          Text(
            "Coffee Bee Order".toUpperCase(),
            style: StyleApp.style800
                .copyWith(fontSize: 25, wordSpacing: 6, letterSpacing: 3),
          ),
          30.height,
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => itemTypeLogin(
                  imageUrl: listType[index].imageUrl,
                  title: listType[index].title,
                  type: listType[index].type,
              ),
              separatorBuilder: (context, index) => 15.height,
              itemCount: listType.length),
        ],
      ).scrollView(),
      bottomSheet: Text(tdata,
              style: StyleApp.style500.copyWith(fontSize: 16),
              textAlign: TextAlign.center)
          .withWidth(MediaQuery.of(context).size.width)
          .paddingBottom(15),
    );
  }
}
