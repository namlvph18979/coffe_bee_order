import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/views/order/widget/item_order_for_phache.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';
import '../../../../data/remote_bloc/invoice/model_invoice.dart';
import '../../../widgets/expanded_section.dart';

class ItemAll extends StatefulWidget {
  ModelInvoice model;
  Function()? ontap1;

  ItemAll({required this.model,required this.ontap1});

  @override
  State<ItemAll> createState() => _ItemAllState();
}

class _ItemAllState extends State<ItemAll> {
 bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            isSelected = !isSelected;
            setState((){});
          },
          child: itemOrderForPhaChe(
            model: widget.model,
            ontap1: widget.ontap1,
          ),
        ),
        ExpandedSection(
          isSelected: isSelected,
          child: Container(
            margin:const EdgeInsets.fromLTRB(10, 0, 20, 0),
            padding:const EdgeInsets.fromLTRB(10, 5, 0, 5),
            decoration:const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                  widget.model.listSp!.length,
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.model.listSp![index].name,style: StyleApp.style600,).expand(flex: 3),
                      Text("SL: ${widget.model.listSp![index].soluong}",style: StyleApp.style600,).expand(flex: 1),
                    ],
                  ).paddingSymmetric(vertical: 5)
              ),
            ),
          ),
        ),
      ],
    );
  }
}
