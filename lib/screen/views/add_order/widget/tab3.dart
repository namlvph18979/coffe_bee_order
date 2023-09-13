
import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/params/param_create_invoice.dart';
import 'package:coffe_bee_order/data/remote_bloc/product/bloc_prd.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/item_category.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/item_tabbar_auth.dart';
import 'package:coffe_bee_order/screen/widgets/load/load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import 'model_bottom_not.dart';

class Screentab3 extends StatefulWidget {

  CreateHDParam param;
  List<String>? items;

  List<HoadonItemsAdd>? lst_hd_items;

  Screentab3({required this.param,this.items,this.lst_hd_items});

  @override
  State<Screentab3> createState() => _Screentab3State();
}

class _Screentab3State extends State<Screentab3>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final bloc = BlocProduct();
  int page = 0;
  
  @override
  void initState() {
    tabController = TabController(length: bloc.listCat.length, vsync: this);
    tabController.animateTo(page);
    super.initState();
    bloc.getListAll(id: page+2);
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocProduct, CubitState>(
      bloc: bloc,
      builder: (context, state) => Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 20),
        height: MediaQuery.of(context).size.height * 0.85,
        child: ItemTabbarAuth(
            length: bloc.listCat.length,
            scroll: true,
            tabController: tabController,
            onchange: (value) {
              page = value + 2;
              bloc.getListAll(id: page);
            },
            listTap: List.generate(
                bloc.listCat.length, 
                    (index) => Tab(
                      text: "${bloc.listCat[index].name}",
                    )),
            listTapBarView: List.generate(
                bloc.listCat.length,
                    (index) => BlocBuilder<BlocProduct, CubitState>(
                      bloc: bloc,
                      builder: (context, state) {
                        return LoadPage(
                          state: state,
                          height: null,
                          msg: state.msg,
                          reload: () => bloc.getListAll(id: page),
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) => ItemCategory(
                                model: bloc.listAll[index],
                                list: bloc.listAll,
                                ontap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => ModelBottomNote(
                                          model: bloc.listAll[index],
                                      ),
                                      isScrollControlled: true,
                                      shape: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20)))).then((value){
                                    if(value != null){
                                      HoadonItemsAdd item = value;
                                      widget.lst_hd_items?.add(item);
                                      widget.items?.add(item.toJson().toString());
                                      widget.param.id_hd_items = widget.items.toString();
                                      toast("Thêm thành công");
                                      setState(() {});
                                      print("#################list san pham : ${widget.items.toString()}");

                                    }else{
                                      return;
                                    }
                                  });
                                },
                              ),
                              separatorBuilder: (context, index) => 0.height,
                              itemCount: bloc.listAll.length),
                        );
                      },
                    )
            )

        ),
      ),
    );
  }
}
