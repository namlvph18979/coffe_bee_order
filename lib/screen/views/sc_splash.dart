import 'dart:async';

import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/image_path.dart';
import 'package:coffe_bee_order/screen/views/form_auth/sc_start.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
       const Duration(seconds: 3),
            () => const ScreenStart().launch(context,isNewTask: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.bg,
      body: Image.asset(
        ImagePath.logo,
        height: 200,
      ).center(),
    );
  }
}

