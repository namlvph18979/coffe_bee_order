import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Widget CustomButton({
  Color? color,
  Color? textColor,
  required String title,
  BorderSide borderSide = BorderSide.none,
  Function()? onTap,
  bool isLoad = false,
}) {
  return AppButton(
    onTap: isLoad ? () {} : onTap,
    color: color ?? ColorApp.text,
    elevation: 0,
    shapeBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: borderSide,
    ),
    child: isLoad
        ? CircularProgressIndicator(
                color: textColor ?? Colors.white, strokeWidth: 2)
            .withSize(height: 20, width: 20)
        : Text(
            title,
            style: StyleApp.style600.copyWith(
              fontSize: 14,
              color: textColor ?? Colors.white,
            ),
          ),
  );
}
