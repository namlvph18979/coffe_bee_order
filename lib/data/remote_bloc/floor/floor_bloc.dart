import 'package:coffe_bee_order/config/api/api.dart';
import 'package:coffe_bee_order/config/api/api_path.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit_state.dart';
import 'model/model_flor.dart';

class floorBloc extends Cubit<CubitState>{
  floorBloc():super(CubitState());

  List<ModelFloor> list = [];
  Map<String,dynamic>? req;

  getList() async {
    list.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try{
        var res = await Api.getAsync(
            endpoint: ApiPath.floor,
            req: req,

        );
        for(var json in res){
          ModelFloor modelFlor = ModelFloor.fromJson(json);
          list.add(modelFlor);
        }
        emit(state.copyWith(status: BlocStatus.success));

    }catch(e){
        emit(state.copyWith(
            status: BlocStatus.failure,
            msg: Api.checkError(e),
        ));
    }
  }
}