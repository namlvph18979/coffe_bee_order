import 'package:coffe_bee_order/data/remote_bloc/category/catbloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/floor/model_flor.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/add_order/gep_ban/sc_ghep_ban.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/cart_bottom_bar.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/item_table.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/tab3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config/style_app/color_app.dart';
import '../../../config/style_app/style_text.dart';
import '../../../data/cubit_state.dart';
import '../../../data/remote_bloc/table/table_model.dart';
import '../../../data/remote_bloc/user/user_model.dart';

List<ModelFlor> listFlor = [
  ModelFlor(id: 1, name: "Tầng 1"),
  ModelFlor(id: 2, name: "Tầng 2"),
  ModelFlor(id: 3, name: "Tầng 3"),
];
List<modeltable> listTable = [
  modeltable(id: 1, name: "Bàn 1", isActive: true),
  modeltable(id: 2, name: "Bàn 2"),
  modeltable(id: 3, name: "Bàn 3"),
  modeltable(id: 4, name: "Bàn 4"),
  modeltable(id: 5, name: "Bàn 5", isActive: true),
  modeltable(id: 6, name: "Bàn 6"),
  modeltable(id: 7, name: "Bàn 7", isActive: true),
  modeltable(id: 8, name: "Bàn 8"),
  modeltable(id: 9, name: "Bàn 9", isActive: true),
  modeltable(id: 10, name: "Bàn 10"),
];
ModelInvoice modelInvoice = ModelInvoice(
    id: 1,
    type: 0,
    listSp: [],
    // listSp: [
    //   ModelPro(
    //       id: 1,
    //       idCat: 1,
    //       name: "Cà phê đen",
    //       imageUrl: "https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/l-intro-1645231221.jpg",
    //       price: 25000,
    //       description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.",
    //       note: "Đen đá không đường"
    //   ),
    //   ModelPro(
    //       id: 2,
    //       idCat: 1,
    //       name: "Cà phê sữa",
    //       imageUrl: "https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/l-intro-1645231221.jpg",
    //       price: 30000,
    //       description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.",
    //       note: "Không cho sữa"
    //
    //   ),
    //   ModelPro(
    //       id: 3,
    //       idCat: 1,
    //       name: "Cà phê nâu",
    //       imageUrl: "https://static-images.vnncdn.net/files/publish/2022/7/18/cafe-ngon-682.jpg",
    //       price: 30000,
    //       discountPercent: 30,
    //       description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
    //           "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
    //           "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
    //           "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
    //           "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
    //
    //   ),
    //   ModelPro(
    //       id: 3,
    //       idCat: 1,
    //       name: "Cà phê nâu",
    //       imageUrl: "https://static-images.vnncdn.net/files/publish/2022/7/18/cafe-ngon-682.jpg",
    //       price: 30000,
    //       discountPercent: 30,
    //       description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
    //           "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
    //           "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
    //           "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
    //           "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
    //
    //   ),
    // ],
    user: UserModel(id: 1, userName: "Nam lv0", passWord: "12345", phoneNumber: "123456789", Type: 0)
);

class ScreenCreateOrder extends StatefulWidget {
  ModelInvoice? model;

  @override
  State<ScreenCreateOrder> createState() => _ScreenCreateOrderState();
}

class _ScreenCreateOrderState extends State<ScreenCreateOrder>
    with SingleTickerProviderStateMixin {

  final cartbloc = ListCatbloc();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ListCatbloc, CubitState>(
          bloc: cartbloc,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 45,
                centerTitle: true,
                title: Text(
                  "Tạo đơn",
                  style: StyleApp.style600
                      .copyWith(color: ColorApp.text, fontSize: 18),
                ),
                leading: IconButton(
                    onPressed: () {
                      if (tabController.index > 0) {
                        tabController.animateTo(tabController.index - 1);
                      } else {
                        finish(context);
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                actions: [
                  IconButton(
                    onPressed: () {
                      finish(context);
                    },
                    icon: const Icon(
                      Icons.clear_outlined,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              body: TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Tab1(),
                    Tab2(),
                    Tab3(),
                  ]),
            );
          },
        ),
        bottomSheet: CartBottomBar(model: modelInvoice)

    );
  }

  Widget Tab1() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 30),
      child: SingleChildScrollView(
        child: SettingSection(
            title: Text(
              "Chọn Tầng".toUpperCase(),
              style: StyleApp.style700.copyWith(color: Colors.black),
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            items: List.generate(
                listFlor.length,
                (index) => ItemOption(
                      title: listFlor[index].name,
                      onClick: () {
                          tabController.animateTo(1);
                      },
                    ))),
      ),
    );
  }

  Widget Tab2() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 30),
      child: SingleChildScrollView(
        child: SettingSection(
            title: Row(
              children: [
                Text(
                  "Chọn Bàn".toUpperCase(),
                  style: StyleApp.style700.copyWith(color: Colors.black),
                ),

                const Spacer(),
                TextIcon(
                  text: "Ghép",
                  textStyle: StyleApp.style600.copyWith(color: ColorApp.text,fontSize: 16),
                  suffix: const Icon(Icons.compare,size: 20,color: ColorApp.text),
                  onTap: (){
                    ScreenGhepBan(listModel: listTable).launch(context).then((value) {
                      setState(() {
                        if(value != null){
                          print(value.toString());
                          listTable[value[0]-1].isActive = true;
                          listTable[value[1]-1].isActive = true;
                        }
                      });
                    });
                  },
                )
              ],
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            items: [
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(
                    listTable.length,
                    (index) => ItemTable(
                          model: listTable[index],
                          onClick: () {
                            tabController.animateTo(2);
                          },
                        )),
              )
            ]),
      ),
    );
  }

  Widget Tab3() {
    return Container(
      color: Colors.white,
      child: SettingSection(
          title: Text(
            "Chọn Đồ".toUpperCase(),
            style: StyleApp.style700.copyWith(color: Colors.black),
          ),
          headerPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          items: [
            Screentab3(),
          ]),
    );
  }

  Widget ItemOption({
    required String? title,
    Function()? onClick,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 130,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ColorApp.bg,
          border: Border.all(color: ColorApp.text, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Text(title!, style: StyleApp.style700.copyWith(fontSize: 20)),
    ).onTap(onClick);
  }
}
