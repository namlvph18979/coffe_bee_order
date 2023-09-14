import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/screen/views/order/widget/item_order_for_phache.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../data/remote_bloc/invoice/model_invoice.dart';
import '../../../widgets/expanded_section.dart';

class ItemAll extends StatefulWidget {
  ModelInvoice model;

  ItemAll({required this.model});

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
                  widget.model.hoadonItems?.length ?? 0,
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.model.hoadonItems?[index].tenSp.validate() ?? "Đang cập nhat",style: StyleApp.style600,).expand(flex: 3),
                      Text("SL: ${widget.model.hoadonItems?[index].soLuong}",style: StyleApp.style600,).expand(flex: 1),
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
