import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';
import '../../../../config/style_app/style_text.dart';

class ItemTabbarAuth extends StatelessWidget {
  int? length;
  List<Tab> listTap;
  List<Widget> listTapBarView;
  TabController? tabController;
  bool? scroll;

  ItemTabbarAuth(
      {required this.length,
      required this.listTap,
      required this.listTapBarView,
      this.scroll,
      this.tabController});

  @override
  Widget build(BuildContext context) {
    // listTap.length = listTapBarView.length = length!;

    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 250),
      initialIndex: 0,
      length: length!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            labelStyle: StyleApp.style700,
            labelColor: Colors.black,
            indicatorWeight: 3,
            isScrollable: scroll ?? false,
            indicatorColor: ColorApp.text,
            dividerColor: ColorApp.text,
            tabs: listTap,
          ),
          TabBarView(
            controller: tabController,
            children: listTapBarView,
          ).expand()
        ],
      ),
    );
  }
}
