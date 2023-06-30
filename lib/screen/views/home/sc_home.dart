import 'package:coffe_bee_order/data/local_bloc/navbloc.dart';
import 'package:coffe_bee_order/screen/views/account/sc_account.dart';
import 'package:coffe_bee_order/screen/views/home/widget/nav_bottom.dart';
import 'package:coffe_bee_order/screen/views/order/order_for_nv_and_tn/sc_order.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_nguyen_lieu/sc_nguyen_lieu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_page/sc_fast_order.dart';
import '../order/order_for_pha_che/sc_oder_for_phache.dart';


class ScreenHome extends StatefulWidget {
  bool isPhache;


  ScreenHome({required this.isPhache});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> with SingleTickerProviderStateMixin{

  late TabController controller;

  @override
  void initState() {
    controller = TabController(
        length: widget.isPhache ? 3 : 4,
        vsync: this,
        initialIndex: 0
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<NavBloc,int>(
        listener: (context, state) {
            if(controller.index != state){
              controller.animateTo(state);
            }
        },
      child: Scaffold(
        body: widget.isPhache
        ? TabBarView(
            controller: controller,
            physics:const NeverScrollableScrollPhysics(),
            children:
            [
              ScreenOrderForPhaChe(),
              ScreenNguyenlieu(),
              ScreenAccount(),
            ]
        )
        : TabBarView(
            controller: controller,
            physics:const NeverScrollableScrollPhysics(),
            children:
            [
              ScreenFastOrder(),
              Screeninvoice(),
              ScreenOrder(),
              ScreenAccount(),
            ]
        ),
        bottomNavigationBar: BottomNav(isPhaChe: widget.isPhache),
      ),
    );
  }
}
