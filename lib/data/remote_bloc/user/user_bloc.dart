
import 'package:coffe_bee_order/config/api/api.dart';
import 'package:coffe_bee_order/config/api/api_path.dart';
import 'package:coffe_bee_order/config/db/db_key_local.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/model/user_model.dart';
import 'package:coffe_bee_order/screen/views/home/sc_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import 'param/login_param.dart';


class userbloc extends Cubit<CubitState> {
  userbloc() : super(CubitState());


  login(LoginParam param,{String? type}) async {
    emit(state.copyWith(status: BlocStatus.loading));
    try{
      var res = await Api.postAsync(
          endpoint: ApiPath.login,
          req: param.toMap(), isForm: true);
        if (res['status']) {
          if(res['data']['chucNang'] == type){
            emit(state.copyWith(
                status: BlocStatus.success, msg: "Đăng nhập thành công."));
            await setValue(DBKeyLocal.user, res['data']);
          }else{
            emit(state.copyWith(
                status: BlocStatus.failure, msg: "Đăng nhập không đúng chức năng!"));
          }
      } else {
        emit(state.copyWith(
            status: BlocStatus.failure,
            msg: res['message'] ??
                "Đăng nhập thất bại. Tài khoản hoặc mật khẩu không chính xác."));
      }
    }catch(e){
      state.copyWith(status: BlocStatus.failure, msg: Api.checkError(e));
    }
  }

  logOut() async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      await DBKeyLocal.remover();
      emit(state.copyWith(
          status: BlocStatus.success, msg: "Đăng xuất thành công."));
    } catch (e) {
      emit(state.copyWith(status: BlocStatus.failure, msg: Api.checkError(e)));
    }
  }
}