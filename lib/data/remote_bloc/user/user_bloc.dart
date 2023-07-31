
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


class userbloc extends Cubit<CubitState> {
  userbloc() : super(CubitState());

  List<UserModel> Luser = [];

  Login({
    required String username,
    required String pass,
    required String type,
    BuildContext? context
  }) async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.getAsync(endpoint: ApiPath.user, req: {});
      for (var json in res) {
        UserModel user = UserModel.fromJson(json);
        Luser.add(user);
      }
      if(Luser.isNotEmpty){
        for (int i = 0; i < Luser.length; i++) {
          if (Luser[i].userName == username &&
              Luser[i].passwd == pass &&
              Luser[i].chucNang == type) {
            await setValue(DBKeyLocal.user, Luser[i].toJson());
            if(type != "Pha Chế"){
              ScreenHome(isPhache: false).launch(context!);
              toast("Đăng nhâập thành công");
              return;
            }else{
              ScreenHome(isPhache: true).launch(context!);
              toast("Đăng nhập thành công");
              return;
            }
          }else{
            toast("Sai tên đăng nhập hoặc mật khẩu");
          }
        }
      }else{

      }
    } catch (e) {
      toast("Sai tên đăng nhập hoặc mật khẩu");
      emit(state.copyWith(status: BlocStatus.failure, msg: Api.checkError(e)));
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
