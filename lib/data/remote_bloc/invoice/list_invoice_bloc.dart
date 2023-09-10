import 'dart:convert';

import 'package:coffe_bee_order/config/api/api.dart';
import 'package:coffe_bee_order/config/api/api_path.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../product/product_model.dart';
import 'model_invoice.dart';

class ListInvoiceBloc extends Cubit<CubitState>{
  ListInvoiceBloc():super(CubitState());

  List<ModelInvoice> invoices = [];

  getList() async {
    invoices.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try{
      var res = await Api.getAsync(
        endpoint: ApiPath.hoaDon,
        hasForm: true
      );

      for(var item in res){
        ModelInvoice model = ModelInvoice.fromJson(item);
        invoices.add(model);
      }
      emit(state.copyWith(
        status: BlocStatus.success,
      ));
    }catch(e){
      emit(state.copyWith(
          status: BlocStatus.failure,
          msg: Api.checkError(e)
      ));
    }
  }

}