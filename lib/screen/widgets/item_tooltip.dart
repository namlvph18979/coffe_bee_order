import 'package:flutter/material.dart';
import '../../../config/style_app/style_text.dart';
import '../../config/style_app/color_app.dart';

class ItemtoolTip extends StatelessWidget {

  String toolText;

  ItemtoolTip({required this.toolText});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolText,
      textStyle: StyleApp.style400.copyWith(color: Colors.white),
      margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      triggerMode: TooltipTriggerMode.tap,
      showDuration:const Duration(minutes: 3),
      decoration: BoxDecoration(
        color: ColorApp.text,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: ColorApp.text,width: 1)
      ),
      child: const Icon(Icons.help,size: 20,color: Colors.white,),
    );
  }
}
