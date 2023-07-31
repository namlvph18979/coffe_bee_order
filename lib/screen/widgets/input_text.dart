import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class InputText extends StatelessWidget {
  TextFieldType textFieldType;
  Widget? prefixIcon;
  String? hintText;
  String? label;
  TextEditingController? controller;
  Function(String value)? onChanged;
  Function(String)? validator;
  Function()? onTap;
  Widget? suffixIcon;
  int maxLines;
  int? maxLength;
  double? radius;
  Color? fillColor;

  InputText({
    this.textFieldType = TextFieldType.NAME,
    this.prefixIcon,
    this.hintText,
    this.controller,
    this.maxLength,
    this.maxLines = 1,
    this.onChanged,
    this.onTap,
    this.label,
    this.suffixIcon,
    this.validator,
    this.radius,
    this.fillColor,
  });
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: ColorApp.text,
            ),
      ),
      child: AppTextField(
        textFieldType: textFieldType,
        controller: controller,
        onTap: onTap,
        readOnly: onTap != null,
        onChanged: onChanged,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: (val) {
          if (validator != null) {
            return validator!(val ?? "");
          }
          return null;
        },
        cursorColor: ColorApp.text,
        textStyle: StyleApp.style500,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: StyleApp.style400.copyWith(color: Colors.grey),
          errorStyle: StyleApp.style400.copyWith(color: Colors.red, fontSize: 11),
          filled: true,
          fillColor: fillColor ?? ColorApp.bg,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 5),
            borderSide:const BorderSide(
              color: ColorApp.text,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ??5),
            borderSide: const BorderSide(
              color: ColorApp.text,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ??5),
            borderSide: const BorderSide(
              color: ColorApp.text,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ??5),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
