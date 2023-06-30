import 'package:flutter/material.dart';

extension WidgetExtention on Widget{
  Future ShowBottomSheet(BuildContext context){
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        clipBehavior: Clip.hardEdge,
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(5))
        ),
        builder: (context) => this,
    );
  }

  Widget scrollView({
    EdgeInsets? padding,
    ScrollController? controller,
    Axis scrollDirection = Axis.vertical,
  }){
    return SingleChildScrollView(
      padding: padding,
        controller: controller,
        scrollDirection: scrollDirection,
        physics:const AlwaysScrollableScrollPhysics(),
        child: this,
    );
  }
}