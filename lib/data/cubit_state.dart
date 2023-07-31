import 'enum/blocstatus.dart';

class CubitState{
  BlocStatus status;
  dynamic data;
  String msg;
  int total;

  CubitState({
    this.status = BlocStatus.initial,
    this.data,
    this.msg = "Lỗi kết nối",
    this.total = 0
  });

  CubitState copyWith({
    BlocStatus? status,
    dynamic data,
    String? msg,
    int? total
}){
  return CubitState(
      status: status ?? this.status,
      data: data ?? this.data,
      msg: msg ?? this.msg,
      total: total ?? this.total
  );
  }
}