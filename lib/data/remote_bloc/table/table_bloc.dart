import 'package:coffe_bee_order/config/api/api.dart';
import 'package:coffe_bee_order/config/api/api_path.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/table/model/Table_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableBloc extends Cubit<CubitState>{
  TableBloc() : super(CubitState());

  List<TableModel> list = [];
  Map<String,dynamic>? req;

  getList({required String id}) async{
    list.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try{
      var res = await Api.getAsync(
          endpoint: ApiPath.table,
          req: req
      );
      for(var json in res){
        TableModel model = TableModel.fromJson(json);
        if(model.idFloor == id){
          list.add(model);
        }
      }
      emit(state.copyWith(status: BlocStatus.success));

    }catch(e){
        emit(state.copyWith(
            status: BlocStatus.failure,
            msg: Api.checkError(e)
        ));
    }
  }

  update() async {
    emit(state.copyWith(status: BlocStatus.loading));
    try{
      var res = await Api.putAsync(
          endpoint: "${ApiPath.table}",
          req: {
            "trangThai" : "2"
          }
      );
      if(res['isActive'] == true){
        emit(state.copyWith(
          status: BlocStatus.success,
          msg: "Ghép bàn thành công",
        ));
      }else{
        emit(state.copyWith(
            status: BlocStatus.failure,
            msg: "Ghép thất bại"
        ));
      }
    }catch(e){
      emit(state.copyWith(
          status: BlocStatus.failure,
          msg: Api.checkError(e)
      ));
    }
  }
}