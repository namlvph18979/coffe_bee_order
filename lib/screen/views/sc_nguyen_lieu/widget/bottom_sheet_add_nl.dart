import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/config/style_app/validator.dart';
import 'package:coffe_bee_order/data/check_state.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/nguyenlieu/nguyenlieu_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/nguyenlieu/nguyenlieu_model.dart';
import 'package:coffe_bee_order/screen/widgets/custom_button.dart';
import 'package:coffe_bee_order/screen/widgets/custom_drop_down.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:coffe_bee_order/screen/widgets/item_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';

class bottomChooseNl extends StatefulWidget {
  List<ModelNL> list;

  bottomChooseNl({required this.list});

  @override
  State<bottomChooseNl> createState() => _bottomChooseNlState();
}

class _bottomChooseNlState extends State<bottomChooseNl> {
  final bloc = Nguyenlieu_BLoc();
  final num = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  ModelNL valuechoose = ModelNL();


  getNl(){
    if(_keyForm.currentState!.validate() && valuechoose.idNguyenLieu != null){
      bloc.getNl(id: valuechoose.idNguyenLieu,quantity: num.text);
    }else{
      toast("Vui lòng thêm số lượng và nguyên liệu đầy đủ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.clear,
            size: 30,
            color: Colors.black,
          ).onTap(() {
            finish(context);
          }),
          10.height,
          Text(
            "Lấy nguyên liệu",
            style: StyleApp.style700.copyWith(fontSize: 17),
          ),
          20.height,
          CustomDropDown(
              radius: 3,
              isName: true,
              listItem: widget.list,
              hint: "Chọn nguyên liệu",
              onchange: (p0) {
                valuechoose = p0;
                print("###"+valuechoose.idNguyenLieu.toString());
              },
          ),
          20.height,
          itemInputText(
            labeltext: "Số lượng",
            type: TextFieldType.OTHER,
            controller: num,
            validator: (p0) {
              return ValidatorApp.checkNull(text: p0, isTextFiled: true,isCheck: true);
            },
          ),
          20.height,
          BlocConsumer<Nguyenlieu_BLoc, CubitState>(
            bloc: bloc,
            listener: (context, state) {
              CheckStateBloc.checkNoLoad(
                  context,
                  state,
                  success: () {
                    toast("Lấy thành công");
                    finish(context);
                    context.read<Nguyenlieu_BLoc>().getList();
                  },
              );
            },
            builder: (context, state) {
              return CustomButton(
                title: "Lấy",
                onTap: getNl,
                isLoad: state.status == BlocStatus.loading
              );
            },
          ).withWidth(double.infinity)
        ],
      ).paddingSymmetric(horizontal: 10, vertical: 15),
    );
  }
}
