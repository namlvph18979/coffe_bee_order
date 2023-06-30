import 'package:coffe_bee_order/my_app.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();

  runApp(const MyApp());
}


