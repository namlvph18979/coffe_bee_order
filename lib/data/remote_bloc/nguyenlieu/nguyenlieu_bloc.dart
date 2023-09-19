import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/api/api.dart';
import '../../../config/api/api_path.dart';
import '../../enum/blocstatus.dart';
import 'nguyenlieu_model.dart';

class Nguyenlieu_BLoc extends Cubit<CubitState>{
  Nguyenlieu_BLoc():super(CubitState());

  List<ModelNL> list = [];

  getList() async {
    list.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try{
      var res = await Api.getAsync(
          endpoint: ApiPath.nguyenlieu,
          req: {}
      );
      if(res != null) {
        for (var json in res) {
          ModelNL nl = ModelNL.fromJson(json);
          list.add(nl);
        }
        emit(state.copyWith(status: BlocStatus.success));
      }else{
        emit(state.copyWith(status: BlocStatus.failure));

      }
    }catch(e){
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: Api.checkError(e,ApiPath.nguyenlieu,""),
      ));
    }
  }


  getNl({String? id,String? quantity}) async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.postAsync(
          endpoint: ApiPath.Laynguyenlieu,
          req: {
            "id_nguyenlieu": id,
            "soLuong" : quantity},
          isForm: true);
      if (res['Id_nguyenLieu'] != null) {
        emit(state.copyWith(
            status: BlocStatus.success, msg: "Lấy thành công"));
      } else {
        emit(state.copyWith(
            status: BlocStatus.failure, msg: "Lấy thất bại"));
      }
    } catch (e) {
      emit(state.copyWith(status: BlocStatus.failure, msg: "Gửi đơn thất bại"));
    }
  }
}