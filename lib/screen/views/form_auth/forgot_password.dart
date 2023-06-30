import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/step2.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/step1.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/step3.dart';
import 'package:coffe_bee_order/screen/widgets/dialog/success_dialog.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config/style_app/color_app.dart';

class ScreenForgotPass extends StatefulWidget {
  String title;

  ScreenForgotPass({required this.title});

  @override
  State<ScreenForgotPass> createState() => _ScreenForgotPassState();
}

class _ScreenForgotPassState extends State<ScreenForgotPass> {

  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
        title: widget.title.toUpperCase(),
        align: true
      ),
      body: Theme(
          data: Theme.of(context).copyWith(
            colorScheme:const ColorScheme.light(primary: ColorApp.text)
          ),
          child: Stepper(
            controlsBuilder: (context, details) {
              return const SizedBox.shrink();
            },
            currentStep: currentStep,
            elevation: 2,
            type: StepperType.horizontal,
            onStepTapped: (value) {
              setState(() {
                if(currentStep > value){
                  currentStep = value;
                }
              });
            },
            steps: [
                Step(
                    isActive: currentStep >= 0,
                    state: currentStep > 0 ? StepState.complete : StepState.indexed,
                    title: Text("Xác Thực",style: StyleApp.style600.copyWith(color: Colors.black),),
                    content: ItemStep1(ontap: (){
                      setState(() {currentStep++;});
                    })),
                Step(
                  isActive: currentStep >= 1,
                  state: currentStep > 1 ? StepState.complete : StepState.indexed,
                  title: Text("OTP",style: StyleApp.style600.copyWith(color: Colors.black)),
                  content: ItemStep2(onTap: (){
                      setState(() {currentStep++;});
                  })),
              Step(
                  isActive: currentStep >= 2,
                  state: currentStep > 2 ? StepState.complete : StepState.indexed,
                  title: Text("Hoàn Tất",style: StyleApp.style600.copyWith(color: Colors.black)),
                  content: ItemStep3(onTap: (){
                    showInDialog(
                      context,
                      dialogAnimation: DialogAnimation.SCALE,
                      transitionDuration: const Duration(milliseconds: 250),
                      builder: (p0) => SuccessDialog(
                          ontap1: (){
                            finish(context);
                            finish(context);
                            finish(context);
                            },
                          title: "Hoàn tất",
                          des: "Bạn đã thay đổi mật khẩu thành công "
                              "vui lòng đăng nhập với mật khẩu vừa tạo"),
                    );
                  })),
            ])),
    );
  }
}
