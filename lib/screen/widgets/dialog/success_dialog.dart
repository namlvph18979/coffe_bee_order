import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config/style_app/color_app.dart';
import '../../../config/style_app/style_text.dart';

class SuccessDialog extends StatelessWidget {
  String title;
  String des;
  Function()? ontap1;


  SuccessDialog({
    required this.title,
    required this.des,
    required this.ontap1
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        padding:const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorApp.bg,
          borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          15.height,
          Text(title,style: StyleApp.style800.copyWith(fontSize: 24)),
          10.height,
          Text(des,style: StyleApp.style400,textAlign: TextAlign.center),
          const Spacer(),
          Center(
            child: Container(
              width: 100,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ColorApp.text,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Text("Xác nhận",style: StyleApp.style700.copyWith(fontSize: 15,color: Colors.white),),
            ).onTap(ontap1),
          )
        ],
      ),
    );
  }
}
