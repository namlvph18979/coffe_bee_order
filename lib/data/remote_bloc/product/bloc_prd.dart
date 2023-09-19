
import 'package:coffe_bee_order/config/api/api.dart';
import 'package:coffe_bee_order/config/api/api_path.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/category/model/Cat_model.dart';
import 'package:coffe_bee_order/data/remote_bloc/product/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProduct extends Cubit<CubitState> {
  BlocProduct() : super(CubitState());

  List<ModelPro> listAll = [];
  List<ModelPro> listCoffees = [];
  List<ModelPro> listMilkTeas = [];
  List<ModelPro> listSnacks = [];
  List<ModelPro> listOtherDrinks = [];
  List<ModelPro> listIceCreams = [];
  List<int> count = [];

  List<ModelCat> listCat = [
    ModelCat(id: 2, name: "Coffee"),
    ModelCat(id: 3, name: "Trà Sữa"),
    ModelCat(id: 4, name: "Đồ ăn vặt"),
    ModelCat(id: 5, name: "Đồ uống khác"),
    ModelCat(id: 6, name: "Kem các loại"),
  ];

  getListAll({required int id}) async {
    listAll.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.getAsync(
        endpoint: ApiPath.prodCat + id.toString(),
        req: {},
      );
      if(res["status"]) {
        for (var json in res['data']) {
          ModelPro Modelpro = ModelPro.fromJson(json);
          listAll.add(Modelpro);
        }
        emit(state.copyWith(status: BlocStatus.success));
      }else{
        emit(state.copyWith(status: BlocStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: Api.checkError(e,"${ApiPath.prodCat + id.toString()}",""),
      ));
    }
  }

  getList1() async {
    listCoffees.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.getAsync(
        endpoint: ApiPath.prodCat + listCat[0].id.toString(),
        req: {},
        hasForm: true,
      );
      if(res['status']) {
        for (var json in res['data']) {
          ModelPro Modelpro = ModelPro.fromJson(json);
          listCoffees.add(Modelpro);
        }
        emit(state.copyWith(status: BlocStatus.success));
      }else{
        emit(state.copyWith(status: BlocStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: Api.checkError(e,"${ApiPath.prodCat + listCat[0].id.toString()}",""),
      ));
    }
  }

  getList2() async {
    listMilkTeas.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.getAsync(
        endpoint: ApiPath.prodCat + listCat[1].id.toString(),
        req: {},
      );
      if(res['status']) {
        for (var json in res['data']) {
          ModelPro Modelpro = ModelPro.fromJson(json);
          listMilkTeas.add(Modelpro);
        }
        emit(state.copyWith(status: BlocStatus.success));
      }else{
        emit(state.copyWith(status: BlocStatus.failure));

      }
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: Api.checkError(e,"${ApiPath.prodCat + listCat[1].id.toString()}",""),
      ));
    }
  }

  getList3() async {
    listSnacks.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.getAsync(
        endpoint: ApiPath.prodCat + listCat[2].id.toString(),
        req: {},
      );
      if(res['status']) {
        for (var json in res['data']) {
          ModelPro Modelpro = ModelPro.fromJson(json);
          listSnacks.add(Modelpro);
        }
        emit(state.copyWith(status: BlocStatus.success));
      }else{
        emit(state.copyWith(status: BlocStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: Api.checkError(e,ApiPath.prodCat + listCat[2].id.toString(),""),
      ));
    }
  }

  getList4() async {
    listOtherDrinks.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.getAsync(
        endpoint: ApiPath.prodCat + listCat[3].id.toString(),
        req: {},
      );
      if(res['status']) {
        for (var json in res['data']) {
          ModelPro Modelpro = ModelPro.fromJson(json);

          listOtherDrinks.add(Modelpro);
        }
        emit(state.copyWith(status: BlocStatus.success));
      }else{
        emit(state.copyWith(status: BlocStatus.failure));

      }
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: Api.checkError(e, ApiPath.prodCat + listCat[3].id.toString(),""),
      ));
    }
  }

  getList5() async {
    listIceCreams.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.getAsync(
        endpoint: ApiPath.prodCat + listCat[4].id.toString(),
        req: {},
      );
      if(res['status']) {
        for (var json in res['data']) {
          ModelPro Modelpro = ModelPro.fromJson(json);
          listIceCreams.add(Modelpro);
        }
        emit(state.copyWith(status: BlocStatus.success));
      }else{
        emit(state.copyWith(status: BlocStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: Api.checkError(e,"${ApiPath.prodCat + listCat[4].id.toString()}",""),
      ));
    }
  }
}
