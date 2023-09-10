import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/views/form_auth/sign_in/sc_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../widgets/image_network_view.dart';

class itemTypeLogin extends StatelessWidget {

  String imageUrl;
  String title;
  String type;

  itemTypeLogin({
    required this.imageUrl,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 120,
      margin:const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Positioned(
            child: ImageNetWorkView(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: size.width,
                radius: BorderRadius.circular(5)),
          ),
          Positioned(
              child: Container(
                height: 120,
                width: size.width/3,
                padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient:const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.black,
                          Colors.black87,
                          Colors.transparent
                        ])
                ),
                child: Text(title,style: StyleApp.style700.copyWith(
                    fontSize: 16,
                    color: Colors.white),)
              )),
          const Positioned(
              top: 40,
              right: 0,
              child: Icon(Icons.chevron_right_outlined, size: 40,color: Colors.white,)),
        ],
      ),
    ).onTap((){
      print("##############$type##############");
      ScreenSignIn(type).launch(context,
        pageRouteAnimation: PageRouteAnimation.Slide);
    });
  }
}
