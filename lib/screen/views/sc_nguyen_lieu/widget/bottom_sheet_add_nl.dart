import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/nguyenlieu/nguyenlieu_model.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:coffe_bee_order/screen/widgets/item_input.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';

class bottomChooseNl extends StatefulWidget {

  List<ModelNL> list;

  bottomChooseNl({required this.list});

  @override
  State<bottomChooseNl> createState() => _bottomChooseNlState();
}

class _bottomChooseNlState extends State<bottomChooseNl> {

  final num = TextEditingController();
  String? valuechoose;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.clear, size: 30,color: Colors.black,).onTap((){
          finish(context);}),
        10.height,
        Text("Lấy nguyên liệu",style: StyleApp.style700.copyWith(fontSize: 17),),
        20.height,
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: ColorApp.text,width: 1),
            borderRadius: BorderRadius.circular(3),
          ),
          child: DropdownButton(
              hint: Text("Chọn nguyên liệu",style: StyleApp.style600,),
              value: valuechoose,
              style: StyleApp.style500,
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(10),
              items: List.generate(
                  widget.list.length,
                      (index) {
                    return DropdownMenuItem(
                        value: widget.list[index].name,
                        child: Text(
                          widget.list[index].soluong != null
                            ? "${widget.list[index].name!} - Còn lại: ${widget.list[index].soluong}/${widget.list[index].type}"
                            : "${widget.list[index].name!} - Còn lại: Chưa cập nhật",
                          style: StyleApp.style600,)
                    );
                  }),
              onChanged: (value) {
                  setState(() {
                      valuechoose = value;
                  });
              },).paddingSymmetric(horizontal: 10),
        ),

        20.height,
        itemInputText(
          labeltext: "Số lượng",
          type: TextFieldType.OTHER,
          controller: num,
        ),

        20.height,
        itemButton(
          textBtn: "Lấy",
          width: MediaQuery.of(context).size.width,
          onPress: () {
            finish(context);
          },
        )
      ],
    ).paddingSymmetric(horizontal: 10,vertical: 15);
  }
}

