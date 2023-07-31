import 'package:coffe_bee_order/config/api/api.dart';
import 'package:coffe_bee_order/config/api/api_path.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../product/product_model.dart';

class ListInvoiceBloc extends Cubit<CubitState>{
  ListInvoiceBloc():super(CubitState());

  List<ModelPro> invoice = [];
  int totalPrice = 0;

  getList() async {
    invoice.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try{
      var res = await Api.getAsync(
        endpoint: ApiPath.CATEGORY,
        req: {},
      );
      for(var json in res){
        ModelPro model = ModelPro.fromJson(json);
        invoice.add(model);
      }
      getPrice();
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
  getPrice(){
    totalPrice = 0;
    for (var element in invoice){
      if(element.discountPercent != null){
        totalPrice += ((element.price.validate() * element.soluong.validate()) *
            (100 - element.discountPercent!) ~/100);
      }else{
        totalPrice += (element.price.validate() * element.soluong.validate());
      }

    }
  }
}