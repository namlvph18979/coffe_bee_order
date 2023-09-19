import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  List listItem;
  String hint;
  dynamic value;
  bool enable;
  Function(dynamic)? validator;
  Function(dynamic)? onchange;
  double? radius;
  Color? fillColor;
  bool isName;

  CustomDropDown({super.key,
    required this.listItem,
    required this.hint,
    this.value,
    this.onchange,
    this.fillColor,
    this.radius,
    this.isName = false,
    this.validator,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      menuMaxHeight: 400,
      icon: const Icon(Icons.keyboard_arrow_down),
      borderRadius: BorderRadius.circular(5),
      onChanged: onchange,
      isExpanded: true,
      style: StyleApp.style400.copyWith(fontSize: 14, color: ColorApp.text),
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      hint: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          hint,
          style: StyleApp.style400.copyWith(fontSize: 14, color: ColorApp.text),
        ),
      ),
      decoration: InputDecoration(
          enabled: enable,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 50),
            borderSide: const BorderSide(
              color: ColorApp.text,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 50),
            borderSide: const BorderSide(
              color: ColorApp.text,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 50),
            borderSide: const BorderSide(
              color: ColorApp.text,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 50),
            borderSide: const BorderSide(
              color: ColorApp.text,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 50),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          filled: true,
          isDense: true,
          fillColor: fillColor ?? Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
      items: listItem
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  !isName ? e.toString() : e.tenNguyenLieu.toString(),
                  style: StyleApp.style400,
                ),
              ))
          .toList(),
    );
  }
}
