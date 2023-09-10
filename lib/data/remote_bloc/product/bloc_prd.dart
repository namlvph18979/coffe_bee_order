import 'dart:math';

import 'package:coffe_bee_order/config/api/api.dart';
import 'package:coffe_bee_order/config/api/api_path.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/category/model/Cat_model.dart';
import 'package:coffe_bee_order/data/remote_bloc/product/product_model.dart';
import 'package:coffe_bee_order/screen/views/add_order/widget/tab3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProduct extends Cubit<CubitState>{
    BlocProduct(): super(CubitState());
    List<ModelPro> list1 = [];
    List<ModelPro> list2 = [];
    List<ModelPro> list3 = [];
    List<ModelPro> list4 = [];
    List<ModelPro> list5 = [];
    List<int> count = [];

    List<ModelCat> listCat=[
      ModelCat(
          id: 1,
          name: "Coffee"
      ),
      ModelCat(
          id: 2,
          name: "Trà Sữa"
      ),
      ModelCat(
          id: 3,
          name: "Đồ uống khác"
      ),
      ModelCat(
          id: 4,
          name: "Đồ ăn vặt"
      ),
      ModelCat(
          id: 5,
          name: "Kem các loại"
      ),

    ];

    getList1() async {
      list1.clear();
      emit(state.copyWith(status: BlocStatus.loading));
      try{
        var res = await Api.getAsync(
          endpoint: ApiPath.prod,
          req: {},

        );
        for(var json in res){
          ModelPro Modelpro = ModelPro.fromJson(json);
          if(Modelpro.idDanhMuc == "1"){
            list1.add(Modelpro);
          }
        }
        emit(state.copyWith(status: BlocStatus.success));

      }catch(e){
        emit(state.copyWith(
          status: BlocStatus.failure,
          msg: Api.checkError(e),
        ));
      }
    }
    getList2() async {
      list2.clear();
      emit(state.copyWith(status: BlocStatus.loading));
      try{
        var res = await Api.getAsync(
          endpoint: ApiPath.prod,
          req: {},

        );
        for(var json in res){
          ModelPro Modelpro = ModelPro.fromJson(json);
          if(Modelpro.idDanhMuc == "2"){
            list2.add(Modelpro);
          }

        }
        emit(state.copyWith(status: BlocStatus.success));

      }catch(e){
        emit(state.copyWith(
          status: BlocStatus.failure,
          msg: Api.checkError(e),
        ));
      }
    }
    getList3() async {
      list3.clear();
      emit(state.copyWith(status: BlocStatus.loading));
      try{
        var res = await Api.getAsync(
          endpoint: ApiPath.prod,
          req: {},

        );
        for(var json in res){
          ModelPro Modelpro = ModelPro.fromJson(json);
          if(Modelpro.idDanhMuc == "3"){
            list3.add(Modelpro);
          }

        }
        emit(state.copyWith(status: BlocStatus.success));

      }catch(e){
        emit(state.copyWith(
          status: BlocStatus.failure,
          msg: Api.checkError(e),
        ));
      }
    }
    getList4() async {
      list4.clear();
      emit(state.copyWith(status: BlocStatus.loading));
      try{
        var res = await Api.getAsync(
          endpoint: ApiPath.prod,
          req: {},

        );
        for(var json in res){
          ModelPro Modelpro = ModelPro.fromJson(json);
          if(Modelpro.idDanhMuc == "4"){
            list4.add(Modelpro);
          }

        }
        emit(state.copyWith(status: BlocStatus.success));

      }catch(e){
        emit(state.copyWith(
          status: BlocStatus.failure,
          msg: Api.checkError(e),
        ));
      }
    }
    getList5() async {
      list5.clear();
      emit(state.copyWith(status: BlocStatus.loading));
      try{
        var res = await Api.getAsync(
          endpoint: ApiPath.prod,
          req: {},

        );
        for(var json in res){
          ModelPro Modelpro = ModelPro.fromJson(json);
          if(Modelpro.idDanhMuc == "5"){
            list5.add(Modelpro);
          }

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