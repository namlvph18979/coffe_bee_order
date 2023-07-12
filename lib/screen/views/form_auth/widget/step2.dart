import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide OTPTextField;
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../../../widgets/item_button.dart';

class ItemStep2 extends StatelessWidget {

  Function()? onTap;
  OtpFieldController otpCode;


  ItemStep2({this.onTap,required this.otpCode});

  @override
  Widget build(BuildContext context) {

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            30.height,
            Text("Xác thực số điện thoại",
              style: StyleApp.style700.copyWith(color: Colors.black,fontSize: 16),),
            15.height,
            Text("Vui lòng nhập mã xác thực vừa được gửi về số điện thoại của bạn.",
              style: StyleApp.style400.copyWith(color: Colors.black),),
            25.height,
            OTPTextField(
                controller: otpCode,
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 5,
                keyboardType: TextInputType.number,
                style: StyleApp.style600.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                onChanged: (value) {
                },
                onCompleted: (pin) {
                }
            ),
          20.height,
          itemButton(
            textBtn: "Tiếp tục",
            width: MediaQuery.of(context).size.width,
            onPress: onTap,
          ),
          15.height,
          Center(
            child: OtpTimerButton(
              text:const Text('Gửi lại mã', style: TextStyle(fontSize: 14),
              ),
              buttonType: ButtonType.text_button,
              backgroundColor: Colors.blue,
              duration: 180,
              onPressed: () {

              },
            ),
          ),
        ],
    ).scrollView();
  }
}
