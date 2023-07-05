import 'package:coffe_bee_order/data/remote_bloc/category/model/Cat_model.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/item_category.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/item_tabbar_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../data/remote_bloc/product/product_model.dart';

List<ModelCat> listCat=[
  ModelCat(
      id: 1,
      name: "Coffee"
  ),
  ModelCat(
      id: 2,
      name: "Trà Sữa"
  ),
  ModelCat(
      id: 3,
      name: "Đồ uống khác"
  ),
  ModelCat(
      id: 4,
      name: "Đồ ăn vặt"
  ),
  ModelCat(
      id: 5,
      name: "Kem các loại"
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
      id: 6,
      idCat: 2,
      name: "Trà sữa dâu",
      imageUrl: "https://phuongnamvina.com/img_data/images/mo-quan-tra-sua-can-nhung-gi-12-buoc-mo-quan-tra-sua-thanh-cong.jpg",
      price: 250000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 7,
      idCat: 2,
      name: "Trà sữa trứng nướng",
      imageUrl: "https://phuongnamvina.com/img_data/images/mo-quan-tra-sua-can-nhung-gi-12-buoc-mo-quan-tra-sua-thanh-cong.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 8,
      idCat: 2,
      name: "Trà sữa thái xanh",
      imageUrl: "https://phuongnamvina.com/img_data/images/mo-quan-tra-sua-can-nhung-gi-12-buoc-mo-quan-tra-sua-thanh-cong.jpg",
      price: 30000,
      discountPercent: 30,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
          "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
          "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
          "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
          "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."

  ),
  ModelPro(
      id: 9,
      idCat: 3,
      name: "Nước ép cam",
      imageUrl: "https://www.cet.edu.vn/wp-content/uploads/2020/06/cach-lam-nuoc-ep-dua-hau.jpg",
      price: 250000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 10,
      idCat: 3,
      name: "Nước ép dâu",
      imageUrl: "https://www.cet.edu.vn/wp-content/uploads/2020/06/cach-lam-nuoc-ep-dua-hau.jpg",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 11,
      idCat: 4,
      name: "Bim Bim cay",
      imageUrl: "https://cf.shopee.vn/file/821b6cea5112d420911211eb563aaa28",
      price: 250000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 12,
      idCat: 4,
      name: "Bim bim ngô",
      imageUrl: "https://cf.shopee.vn/file/821b6cea5112d420911211eb563aaa28",
      price: 30000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 13,
      idCat: 5,
      name: "Kem dâu",
      imageUrl: "https://static.hotdeal.vn/images/695/694824/500x500/146677-ngay-hoi-kem-tuoi-an-kem-thoa-thich-tai-halloween-ice-cream.jpg",
      price: 250000,
      description: "Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng."
  ),
  ModelPro(
      id: 14,
      idCat: 5,
      name: "Kem dâu",
      imageUrl: "https://static.hotdeal.vn/images/695/694824/500x500/146677-ngay-hoi-kem-tuoi-an-kem-thoa-thich-tai-halloween-ice-cream.jpg",
      price: 250000,
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
    return Container(
      color: Colors.white,
      padding:const EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height * 0.85,
      child: ItemTabbarAuth(
            length: listCat.length,
            scroll: true,
            listTap: List.generate(
                listCat.length,
                    (index) => Tab(
                    text: '${listCat[index].name} (${listPro.length})')
            ),

            listTapBarView: List.generate(
                  listCat.length,
                  (e) {
                      return Tab(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => ItemCategory(
                            model: listPro[index],
                            list: listPro,
                            invoice: widget.invoice,
                          ),
                          separatorBuilder: (context, index) => 10.height,
                          itemCount: listPro.length));
                  }, )
        ),
    );
  }

}

