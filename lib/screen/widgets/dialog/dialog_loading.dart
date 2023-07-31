import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


DialogLoading(
  BuildContext context,
) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                color: ColorApp.text,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Đang tải...",
                style: GoogleFonts.nunito(
                  color: ColorApp.text,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
