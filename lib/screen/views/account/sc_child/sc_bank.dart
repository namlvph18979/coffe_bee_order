import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/image_path.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/bank/bank_model.dart';
import 'package:coffe_bee_order/screen/widgets/image_network_view.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

List<BankModel> banks = [
  BankModel(
      bankName: "VietinBank",
      bankNumber: "109872226800",
      imageQR: ImagePath.qr2,
      mastername: "Le Van Nam",
      imageBank:
          "https://static.wixstatic.com/media/9d8ed5_2c7fa3569e8648ba959693687b6b5a01~mv2.png/v1/fit/w_500,h_500,q_90/file.png"),
  BankModel(
      bankName: "MBBank",
      bankNumber: "0392402306",
      imageQR: ImagePath.qr1,
      mastername: "Le Van Duy",
      imageBank:
          "https://tse1.mm.bing.net/th?id=OIP.voPABljxdx2u4og4gDhVGwAAAA&pid=Api&P=0&h=180"),
  BankModel(
      bankName: "TPBank",
      bankNumber: "00002324263",
      imageQR: ImagePath.qr3,
      mastername: "Nguyen Van Khánh",
      imageBank:
          "https://tse2.mm.bing.net/th?id=OIP.qp-oyiN77A9nM9pFngpC_AHaHa&pid=Api&P=0&h=180"),
];

class ScBank extends StatefulWidget {
  const ScBank({super.key});

  @override
  State<ScBank> createState() => _ScBankState();
}

class _ScBankState extends State<ScBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(title: "Thông tin chuyển khoản"),
      body: SingleChildScrollView(
        child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            itemBuilder: (context, index) => Itembank(banks[index]).onTap(() {
                  showInDialog(
                    context,
                    backgroundColor: Colors.white,
                    contentPadding: const EdgeInsets.all(5),
                    builder: (p0) => Image.asset(
                      banks[index].imageQR ?? ImagePath.logo,
                      fit: BoxFit.cover,
                    ),
                  );
                }),
            separatorBuilder: (context, index) => 15.height,
            itemCount: banks.length),
      ),
    );
  }

  Widget Itembank(BankModel? model) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: ColorApp.text, width: 1.5),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: ImageNetWorkView(
              imageUrl: model!.imageBank.validate(),
              fit: BoxFit.cover,
              radius: BorderRadius.circular(5),
            ),
          ),
          10.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tên ngân hàng: ${model.bankName.validate(value: "")}",
                style: StyleApp.style800
                    .copyWith(color: Colors.black, fontSize: 16),
              ),
              5.height,
              Text(
                "Số tài khoản: ${model.bankNumber.validate()}",
                style: StyleApp.style600.copyWith(color: Colors.black),
              ),
              5.height,
              Text(
                "Chủ tài khoản: ${model.mastername.validate()}",
                style: StyleApp.style600
                    .copyWith(fontSize: 14, color: Colors.black),
              ),
            ],
          ).expand(),
          const Icon(
            Icons.qr_code_scanner_outlined,
            color: Colors.black,
            size: 25,
          )
        ],
      ),
    );
  }
}
