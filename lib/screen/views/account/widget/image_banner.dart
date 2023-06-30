import 'package:coffe_bee_order/screen/widgets/image_network_view.dart';
import 'package:flutter/material.dart';

import '../../../../config/style_app/color_app.dart';
import '../../../../data/remote_bloc/user/user_model.dart';

class ImagebannerUser extends StatefulWidget {
  UserModel? model;


  ImagebannerUser({required this.model});

  @override
  State<ImagebannerUser> createState() => _ImagebannerUserState();
}

class _ImagebannerUserState extends State<ImagebannerUser> {

  String imgEmpty = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMslZfxQ1wrW-XB-2PfM-KSF0zZZAX_D3uyw&usqp=CAU";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: Stack(
        children: [
          ImageNetWorkView(
              imageUrl: widget.model!.avatar ?? imgEmpty,
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              ),

          Positioned(
              top: 160,
              left: 15,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: ColorApp.text,width: 1.5)
                ),
                child: ImageNetWorkView(
                    imageUrl: widget.model!.avatar ?? imgEmpty,
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                    radius: BorderRadius.circular(40),
                ),
              )

          ),
           Positioned(
             top: 210,
             left: 60,
             child: Container(
               width: 22,
               height: 22,
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 color: Colors.grey,
                 border: Border.all(color: Colors.black38,width: 1),
                 shape: BoxShape.circle
               ),
               child: const Icon(Icons.camera_alt,color: Colors.black,size: 17,),
             ),
           )
        ],
      ),
    );
  }
}
