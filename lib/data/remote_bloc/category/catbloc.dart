import 'package:coffe_bee_order/config/api/api.dart';
import 'package:coffe_bee_order/config/api/api_path.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit_state.dart';
import 'model/Cat_model.dart';

class ListCatbloc extends Cubit<CubitState>{

  ListCatbloc() : super(CubitState());

  List<ModelCat> list =[];
  Map<String,dynamic>? req;

  getList() async {
    list.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try{
      var res = await Api.getAsync(
          endpoint: ApiPath.Cat,
          req: req,
      );
      if(res['status']) {
        for (var json in res['data']) {
          ModelCat model = ModelCat.fromJson(json);
          list.add(model);
        }
        emit(state.copyWith(
          status: BlocStatus.success,
        ));
      }else{
        emit(state.copyWith(
          status: BlocStatus.failure,
        ));
      }
    }catch(e){
      emit(state.copyWith(
          status: BlocStatus.failure,
          msg: Api.checkError(e,ApiPath.Cat,"")
      ));
    }
  }
}