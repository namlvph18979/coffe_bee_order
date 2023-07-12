import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FireBaseBloc extends Cubit<CubitState>{
  FireBaseBloc() : super(CubitState());

  String vertficationid ="";
  final FirebaseAuth auth = FirebaseAuth.instance;

  sendCode({
    required String phone,
    required BuildContext context
}) async {
    await auth.verifyPhoneNumber(
        phoneNumber: "+84${phone.substring(1,phone.length)}",
        timeout: const Duration(milliseconds: 1000),
        verificationCompleted: (credential) async {
            await auth.signInWithCredential(credential);
        },
        verificationFailed: (error) async {
            if(error.code == "invalid-phone-number"){
                emit(state.copyWith(
                    status: BlocStatus.failure,
                msg: "Số điện thoại $phone không hợp lệ",
                ));
            }
            emit(state.copyWith(
              status: BlocStatus.failure,
              msg: "Số điện thoại $phone đã bị chặn do hành vi bất thường. Thử lại sau",
            ));
        },
        codeSent: (String verifi,int? forceResendingToken) async {
              vertficationid = verifi;
        } ,
        codeAutoRetrievalTimeout: (String verifi) async{
              vertficationid = verifi;
        });
  }

  CheckCode({
    required String code,
    required BuildContext context
}) async {
    try{
    emit(state.copyWith(
      status: BlocStatus.loading,
    ));
    await FirebaseAuth.instance.signInWithCredential(
      PhoneAuthProvider.credential(
          verificationId: vertficationid,
          smsCode: code)
    ).then((value) {
      if(value.user != null){
        emit(state.copyWith(
            status: BlocStatus.success,
            msg: 'Xác thực thành công'
        ));
      }else{
        emit(state.copyWith(
            status: BlocStatus.failure,
            msg: "Xác thực thất bại"
        ));
      }});
    }catch(e){
      emit(state.copyWith(
        status: BlocStatus.failure,
        msg: "Xác thực thất bại"
      ));
    }
  }
}