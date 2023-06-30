
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_app.dart';

class StyleApp{

  StyleApp._();

  static final TextStyle style800 = GoogleFonts.inter(
      fontSize: 14,
      color: ColorApp.text,
      fontWeight: FontWeight.w800
  );

  static final TextStyle style700 = GoogleFonts.inter(
      fontSize: 14,
      color: ColorApp.text,
      fontWeight: FontWeight.w700
  );

  static final TextStyle style600 = GoogleFonts.inter(
      fontSize: 14,
      color: ColorApp.text,
      fontWeight: FontWeight.w600
  );

  static final TextStyle style500 = GoogleFonts.inter(
      fontSize: 14,
      color: ColorApp.text,
      fontWeight: FontWeight.w500
  );

  static final TextStyle style400 = GoogleFonts.inter(
      fontSize: 14,
      color: ColorApp.text,
      fontWeight: FontWeight.w400
  );
}