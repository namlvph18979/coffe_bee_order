import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/nguyenlieu/nguyenlieu_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/nguyenlieu/nguyenlieu_model.dart';
import 'package:coffe_bee_order/screen/views/sc_nguyen_lieu/widget/bottom_sheet_add_nl.dart';
import 'package:coffe_bee_order/screen/views/sc_nguyen_lieu/widget/item_nguyenlieu.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/load/load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';


class ScreenNguyenlieu extends StatefulWidget {
  const ScreenNguyenlieu({super.key});

  @override
  State<ScreenNguyenlieu> createState() => _ScreenNguyenlieuState();
}


class _ScreenNguyenlieuState extends State<ScreenNguyenlieu> {
  final bloc = Nguyenlieu_BLoc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Nguyenlieu_BLoc,CubitState>(
      bloc: bloc,
      builder: (context, state) => Scaffold(
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
                    list: bloc.list,
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
        body: LoadPage(
          state: state,
          msg: state.msg,
          height: null,
          reload: () => bloc.getList(),
          child: Column(
            children: [
              GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(
                      bloc.list.length,
                          (index) => ItemNguyenLieu(
                          model: bloc.list[index]
                      ))
              ).paddingSymmetric(vertical: 10)
            ],
          ).scrollView(),
        ),
      ),
    );
  }
}
