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
      if(res['status']) {
        for (var json in res['data']) {
          TableModel model = TableModel.fromJson(json);
          list.add(model);
        }
        emit(state.copyWith(status: BlocStatus.success));
      }else{
        emit(state.copyWith(status: BlocStatus.failure));

      }
    }catch(e){
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: Api.checkError(e,ApiPath.table + id.validate(),""),
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
      if(res['status']) {
        for (var json in res['data']) {
          EmptyTableModel model = EmptyTableModel.fromJson(json);
          listEmpty.add(model);
        }
        emit(state.copyWith(status: BlocStatus.success));
      }else{
        emit(state.copyWith(status: BlocStatus.failure));

      }
    }catch(e){
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: Api.checkError(e,ApiPath.emptyTable,""),
      ));
    }
  }

  update() async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.putAsync(
          endpoint: "${ApiPath.table}", req: {"trangThai": "2"});
      if (res['status']) {
        emit(state.copyWith(
          status: BlocStatus.success,
          msg: "Ghép bàn thành công",
        ));
      } else {
        emit(state.copyWith(status: BlocStatus.failure, msg: "Ghép thất bại"));
      }
    } catch (e) {
      emit(state.copyWith(status: BlocStatus.failure, msg: Api.checkError(e,ApiPath.table,"2")));
    }
  }
}
