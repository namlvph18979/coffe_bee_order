import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewCustom extends StatelessWidget {
  bool shrinkWrap;
  bool showFull;
  ScrollPhysics? physics;
  int itemCount;
  int? crossAxisCount;
  IndexedWidgetBuilder itemBuilder;
  double mainAxisExtent;
  double maxWight;
  double crossAxisSpacing;
  double mainAxisSpacing;
  EdgeInsetsGeometry? padding;
  ScrollController? controller;
  Axis scrollDirection;

  GridViewCustom({
    this.physics,
    this.shrinkWrap = false,
    required this.itemCount,
    required this.itemBuilder,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    this.mainAxisExtent = 290,
    this.maxWight = 160,
    this.padding,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.crossAxisCount,
    this.showFull = false,
  });

  checkSize(Size size) {
    double a = size.width / (maxWight + crossAxisSpacing + 15);
    double b = a - a.floor();
    int count = 2;
    if (b > 0.75) {
      count = a.round();
    } else {
      count = a.floor();
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    checkSize(size);
    return GridView.builder(
      controller: controller,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: itemCount > (checkSize(size) * 2) && !showFull
          ? (checkSize(size) * 2)
          : itemCount,
      padding: padding,
      scrollDirection: scrollDirection,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? checkSize(size),
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
