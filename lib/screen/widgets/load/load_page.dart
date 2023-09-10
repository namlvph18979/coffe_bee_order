import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/screen/widgets/load/item_load_failed.dart';
import 'package:flutter/material.dart';

Widget LoadPage({
  required CubitState state,
  Function()? reload,
  Widget? child,
  String? msg,
  double? height = 200
}){
  switch(state.status){
    case BlocStatus.loading:
      return SizedBox(
        height: height,
        child:const Center(
          child: SizedBox(height: 30,width: 30,child: CircularProgressIndicator(color: ColorApp.text,strokeWidth: 2)),
        ),
      );
    case BlocStatus.success:
      return child
          ?? const SizedBox(
            height: 10
          );
    case BlocStatus.failure:
      return SizedBox(
        height: height,
        child: ItemLoadFaild(
            message: msg ?? state.msg,
            onPress: reload
        ),
      );
    default:
      return const SizedBox(
        height: 10,
      );
  }
}