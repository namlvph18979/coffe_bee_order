import 'package:coffe_bee_order/screen/widgets/dialog/dialog_loading.dart';
import 'package:coffe_bee_order/screen/widgets/dialog/dialog_message.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'cubit_state.dart';
import 'enum/blocstatus.dart';

class CheckStateBloc {
  static check(
    BuildContext context,
    CubitState state, {
    String? msg,
    bool isShowMsg = false,
    Function()? success,
    Function()? failure,
  }) {
    if (state.status == BlocStatus.loading) {
      DialogLoading(context);
    }
    if (state.status == BlocStatus.success) {
      Navigator.pop(context);
      isShowMsg ? toast(msg ?? state.msg) : null;
      if (success != null) {
        success();
      }
    }
    if (state.status == BlocStatus.failure) {
      Navigator.pop(context);
      if (failure != null) {
        failure();
      } else {
        DialogMessage(context: context, message: msg ?? state.msg);
      }
    }
  }

  static checkNoLoad(
    BuildContext context,
    CubitState state, {
    String? msg,
    bool isShowMsg = true,
    Function()? success,
    Function()? failure,
  }) {
    if (state.status == BlocStatus.success) {
      isShowMsg ? toast(msg ?? state.msg) : null;
      if (success != null) {
        success();
      }
    }
    if (state.status == BlocStatus.failure) {
      if (failure != null) {
        failure();
      } else {
        DialogMessage(context: context, message: msg ?? state.msg);
      }
    }
  }
}
