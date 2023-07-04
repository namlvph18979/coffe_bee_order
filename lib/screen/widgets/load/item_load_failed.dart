import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:flutter/material.dart';

Widget ItemLoadFaild({
  required String message,
  Function()? onPress,
}){
  return  SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: StyleApp.style500,
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
              onPressed: onPress,
              child: Text("Tải lại",
                style: StyleApp.style500,))
        ],
      ),
  );
}