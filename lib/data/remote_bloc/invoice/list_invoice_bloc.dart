import 'package:coffe_bee_order/config/api/api.dart';
import 'package:coffe_bee_order/config/api/api_path.dart';
import 'package:coffe_bee_order/config/db/db_key_local.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/params/param_create_invoice.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model_invoice.dart';

class ListInvoiceBloc extends Cubit<CubitState> {
  ListInvoiceBloc() : super(CubitState());

  List<ModelInvoice> invoices = [];
  List<ModelInvoice> invoicesTT3 = [];
  CreateHDParam param = CreateHDParam();
  List<HoadonItemsAdd> items = [];
  List<String>? itemsParam;
  String tdata = DateTime.now().toString().splitBefore(" ");
  String timein = DateFormat("hh:mm a").format(DateTime.now());
  var res = getJSONAsync(DBKeyLocal.user);
  UserModel user = UserModel();

  int total = 0;
  int count = 0;

  getList() async {
    invoices.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.getAsync(endpoint: ApiPath.hoaDon, hasForm: true);

      for (var item in res) {
        ModelInvoice model = ModelInvoice.fromJson(item);
        invoices.add(model);
      }
      emit(state.copyWith(
        status: BlocStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: BlocStatus.failure, msg: Api.checkError(e)));
    }
  }

  getListDone() async {
    invoicesTT3.clear();
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.getAsync(endpoint: ApiPath.hoaDonDone, hasForm: true);
      if (res != null) {
        for (var item in res) {
          ModelInvoice model = ModelInvoice.fromJson(item);
          invoicesTT3.add(model);
        }
        emit(state.copyWith(
          status: BlocStatus.success,
        ));
      } else {
        emit(state.copyWith(
          status: BlocStatus.failure,
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: BlocStatus.failure, msg: Api.checkError(e)));
    }
  }

  createHoaDon() async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.postAsync(
          endpoint: ApiPath.createHoaDon, req: param.toMap(), isForm: true);
      if (res != null) {
        emit(state.copyWith(
            status: BlocStatus.success, msg: "Gửi đơn thành công"));
      } else {
        emit(state.copyWith(
            status: BlocStatus.failure, msg: "Gửi đơn thất bại"));
      }
    } catch (e) {
      emit(state.copyWith(status: BlocStatus.failure, msg: "Gửi đơn thất bại"));
    }
  }

  updateTTDon({String? id, String? trangThai}) async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      var res = await Api.postAsync(
        endpoint: ApiPath.updateHoaDon,
        req: {"id_hoaDonCT": id, "trangThai": trangThai},
        isForm: true,
      );
      if (res['note'] != null) {
        emit(state.copyWith(
            status: BlocStatus.success, msg: "Cập nhật thành công"));
      } else {
        emit(state.copyWith(
            status: BlocStatus.failure, msg: "Cập nhật thất bại"));
      }
    } catch (e) {
      emit(
          state.copyWith(status: BlocStatus.failure, msg: "Cập nhật thất bại"));
    }
  }

  addCart({HoadonItemsAdd? item}) {
    emit(state.copyWith(status: BlocStatus.loading));
    user = UserModel.fromJson(res);
    totalPrice(item: item);
    if (item != null) {
      items.add(item);
      itemsParam?.add(item.toJson().toString());
      param.id_giamGia = 0;
      param.trangThai = 0;
      param.time_in = timein;
      param.time_out = "Đang cập nhật";
      param.tongTien = total;
      param.Id_user = user.Id_User;
      param.id_hd_items = itemsParam.toString();
      emit(state.copyWith(status: BlocStatus.success, msg: "Thêm thành công"));
    } else {
      emit(state.copyWith(status: BlocStatus.failure, msg: "Thêm thất bại"));
    }
  }

  removeItems({HoadonItemsAdd? index}) {
    items.remove(index);
    total = total - (index!.soLuong.validate() * index.giaSp.validate());
    count = count - index.soLuong.validate();
    param.tongTien = total;
    addCart();
  }

  totalPrice({HoadonItemsAdd? item}) {
    if(item != null){
      count = count + item.soLuong.validate();
      total += item.giaSp.validate() * item.soLuong.validate();
    }
      return total;
  }

  clear() {
    param == null;
    items.clear();
    total = 0;
    count = 0;
  }
}
