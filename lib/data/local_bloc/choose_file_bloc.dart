
import 'dart:io';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChooseFileBloc extends Cubit<CubitState>{

    ChooseFileBloc() : super(CubitState());

    File? file;
    ImagePicker imagePicker = ImagePicker();

    chooseImgGl() async {
        var res = await imagePicker.pickImage(source: ImageSource.gallery);
        if(res != null){
          file = File(res.path);
        }
        emit(state.copyWith(status: BlocStatus.success));
    }

    chooseImgCM() async {
        var res = await imagePicker.pickImage(source: ImageSource.camera);
        if(res != null){
          file = File(res.path);
        }
        emit(state.copyWith(status: BlocStatus.success));
    }

}