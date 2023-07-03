import 'package:coffe_bee_order/data/remote_bloc/category/category_model.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/item_category.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/item_tabbar_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../data/remote_bloc/product/product_model.dart';

List<ModelCat> listCat=[
  ModelCat(
      id: 1,
      nameCat: "Coffee"
  ),
  ModelCat(
      id: 2,
      nameCat: "Trà Sữa"
  ),
  ModelCat(
      id: 3,
      nameCat: "Đồ uống khác"
  ),
  ModelCat(
      id: 4,
      nameCat: "Đồ ăn vặt"
  ),
  ModelCat(
      id: 5,
      nameCat: "Kem các loại"
  ),

];
List<ModelPro> listPro =[
  ModelPro(
      id: 1,
      idCat: 1,
      name: "Cà phê đen",
      imageUrl: "https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/l-intro-1645231221.jpg",
      price: 25000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 2,
      idCat: 1,
      name: "Cà phê sữa",
      imageUrl: "https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/l-intro-1645231221.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 3,
      idCat: 1,
      name: "Cà phê nâu",
      imageUrl: "https://static-images.vnncdn.net/files/publish/2022/7/18/cafe-ngon-682.jpg",
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
      idCat: 1,
      name: "Bạc xỉu",
      imageUrl: "https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/l-intro-1645231221.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."

  ),
  ModelPro(
      id: 5,
      idCat: 1,
      name: "Cà phê cốt dừa",
      imageUrl: "https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/l-intro-1645231221.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."

  ),
  ModelPro(
      id: 5,
      idCat: 1,
      name: "Cà phê cốt dừa",
      imageUrl: "https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/l-intro-1645231221.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."

  ),
  ModelPro(
      id: 5,
      idCat: 1,
      name: "Cà phê cốt dừa",
      imageUrl: "https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/l-intro-1645231221.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."

  ),
  ModelPro(
      id: 5,
      idCat: 1,
      name: "Cà phê cốt dừa",
      imageUrl: "https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/l-intro-1645231221.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."

  ),
  ModelPro(
      id: 5,
      idCat: 1,
      name: "Cà phê cốt dừa",
      imageUrl: "https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/l-intro-1645231221.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."

  ),

];

class Screentab3 extends StatefulWidget {

  ModelInvoice invoice;

  Screentab3({required this.invoice});

  @override
  State<Screentab3> createState() => _Screentab3State();
}

class _Screentab3State extends State<Screentab3> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
        length: listCat.length,
        vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding:const EdgeInsets.only(bottom: 30),
        height: MediaQuery.of(context).size.height * 0.85,
        child: ItemTabbarAuth(
              length: listCat.length,
              scroll: true,
              listTap: List.generate(
                  listCat.length,
                      (index) => Tab(
                      text: '${listCat[index].nameCat} (${listPro.length})')
              ),

              listTapBarView: List.generate(
                    listCat.length,
                    (index) {
                        return ListView.separated(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => ItemCategory(
                              model: listPro[index],
                              list: listPro,
                              invoice: widget.invoice,
                            ),
                            separatorBuilder: (context, index) => 10.height,
                            itemCount: listPro.length);
                    }, )
          ),
      ),
    );
  }

}

