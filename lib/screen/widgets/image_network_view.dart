import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_bee_order/config/style_app/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/style_app/color_app.dart';

class ImageNetWorkView extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final BorderRadius? radius;
  bool isSvg;
  bool isLoad;


  ImageNetWorkView({
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.color,
    this.radius,
    this.isSvg = false,
    this.isLoad = true,
  });


  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height,
        color: color,
        child: isSvg
        ? SvgPicture.network(
            imageUrl,
            width: MediaQuery.of(context).size.width,
            height: height,
            fit: fit ?? BoxFit.cover,
            placeholderBuilder: (BuildContext context) => isLoad
              ? const Center(
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                          color: ColorApp.text,
                          strokeWidth: 2.5,
                      ),
                  ),
              )
              : const SizedBox())
        : CachedNetworkImage(
            imageUrl: imageUrl,
            color: color,
            fit: fit ?? BoxFit.cover,
            errorWidget: ((context, url, error) {
              return Center(
                child: Image.asset(
                    ImagePath.logo,
                    fit: BoxFit.cover,
                    width: width,
                    height: height,
                ),
              );
            }),
            progressIndicatorBuilder: (context, url, progress) => isLoad
                ? const Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: ColorApp.text,
                      strokeWidth: 2.5,
                ),
              ),
            )
                : const SizedBox()
        ),
      ),
    );
  }
}
