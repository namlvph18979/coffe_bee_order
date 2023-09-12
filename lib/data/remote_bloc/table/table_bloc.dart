import 'package:coffe_bee_order/config/api/api.dart';
import 'package:coffe_bee_order/config/api/api_path.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/table/model/EmptyTableModel.dart';
import 'package:coffe_bee_order/data/remote_bloc/table/model/Table_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class TableBloc extends Cubit<CubitState> {
  TableBloc() : super(CubitState());

  List<TableModel> list = [];
  List<EmptyTableModel> listEmpty = [];

  getList({String? id}) async {
    list.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try{
      var res = await Api.getAsync(
          endpoint: ApiPath.table + id.validate(),
          req: {}
      );
      for(var json in res['data']){
        TableModel model = TableModel.fromJson(json);
        list.add(model);
      }
      emit(state.copyWith(status: BlocStatus.success));

    }catch(e){
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: Api.checkError(e),
      ));
    }
  }

  getListEmpty() async {
    listEmpty.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try{
      var res = await Api.getAsync(
          endpoint: ApiPath.emptyTable,
          req: {}
      );
      for(var json in res){
        EmptyTableModel model = EmptyTableModel.fromJson(json);
        listEmpty.add(model);
      }
      emit(state.copyWith(status: BlocStatus.success));

    }catch(e){
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: Api.checkError(e),
      ));
    }
  }

  update() async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.putAsync(
          endpoint: "${ApiPath.table}", req: {"trangThai": "2"});
      if (res['isActive'] == true) {
        emit(state.copyWith(
          status: BlocStatus.success,
          msg: "Ghép bàn thành công",
        ));
      } else {
        emit(state.copyWith(status: BlocStatus.failure, msg: "Ghép thất bại"));
      }
    } catch (e) {
      emit(state.copyWith(status: BlocStatus.failure, msg: Api.checkError(e)));
    }
  }
}
