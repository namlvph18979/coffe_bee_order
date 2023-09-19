import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/step2.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/step1.dart';
import 'package:coffe_bee_order/screen/views/form_auth/widget/step3.dart';
import 'package:coffe_bee_order/screen/widgets/dialog/dialog_message.dart';
import 'package:coffe_bee_order/screen/widgets/dialog/success_dialog.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:otp_text_field/otp_field.dart';

import '../../../../config/style_app/color_app.dart';

class ScreenForgotPass extends StatefulWidget {
  String title;
  ScreenForgotPass({required this.title});

  @override
  State<ScreenForgotPass> createState() => _ScreenForgotPassState();
}

class _ScreenForgotPassState extends State<ScreenForgotPass> {

  int currentStep = 0;
  final phoneNumber = TextEditingController();
  final contrycode = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  var vetifyCode = '';
  final otpCode = OtpFieldController();

  @override
  void initState() {
    contrycode.text = "+84";
    super.initState();
  }

  void Validate(String num) {
    if (num.isEmpty || num.trim() == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: ColorApp.text,
          content: Text("Không để trống!",
              style: StyleApp.style400.copyWith(color: Colors.white))));
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(title: widget.title.toUpperCase(), align: true),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ItemStep1(),
      )
    );
  }
}
