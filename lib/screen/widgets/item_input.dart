import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../config/style_app/color_app.dart';
import '../../config/style_app/style_text.dart';

class itemInputText extends StatelessWidget {

  String? labeltext;
  String? hint;
  TextFieldType? type;
  TextEditingController? controller;


  itemInputText({
    this.labeltext,
    this.type,
    this.hint,
    this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller, // Optional
      textFieldType: type!,
      decoration: InputDecoration(
        labelText: labeltext,
        hintText: hint ?? "Vui lòng nhập",
        hintStyle: StyleApp.style400.copyWith(color: Colors.grey),
        labelStyle:  StyleApp.style400.copyWith(color: ColorApp.text),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(color: Colors.grey,width: 1)
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(color: ColorApp.text, width: 1),
        ),

      ),
    );
  }
}
