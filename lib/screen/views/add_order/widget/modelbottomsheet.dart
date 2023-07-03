import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/data/remote_bloc/product/product_model.dart';
import 'package:coffe_bee_order/screen/widgets/image_network_view.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';
import '../../../../config/style_app/style_text.dart';
import '../../../../data/remote_bloc/invoice/model_invoice.dart';

class ModelBottomNote extends StatefulWidget {

  ModelPro model;
  ModelInvoice? invoice;

  ModelBottomNote({required this.model, this.invoice});

  @override
  State<ModelBottomNote> createState() => _ModelBottomNoteState();
}

class _ModelBottomNoteState extends State<ModelBottomNote> {

  List<String> listNote = [
    "Thêm đường",
    "Thêm sữa",
    "Ít đường",
    "Ít sữa",
    "Coffee nóng",
    "Coffee lạnh",
    "Ít đá",
    "Nhiều đá",
    "Mang về",
    "Ly giấy",
  ];
  List<String> Selected = [];
  final note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.clear, size: 30,color: Colors.black,).onTap((){
          finish(context);}),
        10.height,
        itemAdd(
            count: widget.model.soluong,
            model: widget.model,
            ontap1: () =>  setState(() {
              if(widget.model.soluong > 0){
                widget.model.soluong--;
              }
            }),
            ontap2: () =>  setState(() {widget.model.soluong++;}),
        ),
        15.height,
        Text("Nội dung ghi chú",style: StyleApp.style600.copyWith(fontSize: 15),),
        10.height,
        AppTextField(
          controller: note,
          textFieldType: TextFieldType.OTHER,
          textAlignVertical: TextAlignVertical.top,
          textStyle: StyleApp.style400,
          cursorWidth: 0.8,
          decoration: InputDecoration(
              hintText: "Ghi chú...",
              hintStyle: StyleApp.style400.copyWith(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:const BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:const BorderSide(color: ColorApp.text)
              )
          ),
        ),
        5.height,
        Text("Bạn chỉ có thể phản hồi 1 lần.",style: StyleApp.style400.copyWith(fontSize: 12,color: Colors.grey),),
        15.height,
        Text("Ghi chú nhanh",style: StyleApp.style600.copyWith(fontSize: 16),),
        15.height,
        fastFeedback(),
        30.height,
        itemButton(
            textBtn: "Thêm sản phẩm",
            onPress: () {
                if(widget.model.soluong <= 0){
                  toast("Vui lòng chọn số lượng!");
                  return;
                }
                finish(context,widget.model);
                print("############ ${widget.model.soluong}");
            },
        ).withWidth(MediaQuery.of(context).size.width)
      ],
    ).paddingSymmetric(vertical: 10,horizontal: 15);
  }

  fastFeedback(){
    return Wrap(
      children: listNote.map(
            (choice) {
          bool isSelected = false;
          if (Selected.contains(choice)) {
            isSelected = true;
          }
          return GestureDetector(
              onTap: () {
                setState(() {
                  if (!Selected.contains(choice) && Selected.isEmpty) {
                    Selected.add(choice);
                  }else if(!Selected.contains(choice) && Selected.length == 1){
                    Selected.removeAt(0);
                    Selected.add(choice);
                  } else {
                    Selected.remove(choice);
                  }
                  note.text = choice;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: isSelected ? ColorApp.text : Colors.grey,
                          width: 1)),
                  child: Text(choice,style: TextStyle(color: isSelected ? ColorApp.text : Colors.grey, fontSize: 14),),
                ),
              ));
        },
      ).toList(),
    );
  }
  Widget itemAdd({
    required ModelPro model,
    required int count,
    required Function() ontap1,
    required Function() ontap2
  }){

    return SizedBox(
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: ImageNetWorkView(
                imageUrl: model.imageUrl,
                fit: BoxFit.cover,
            ),
          ),
          10.width,

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.height,
                Text(model.name,style: StyleApp.style600.copyWith(color: Colors.black),
                  overflow: TextOverflow.ellipsis,maxLines: 2,),
                5.height,
                model.discountPercent != null
                  ? Text("Ưu đãi: giảm ${model.discountPercent}%",style: StyleApp.style500.copyWith(color: Colors.black),)
                  : Text("Chưa có ưu đãi",style: StyleApp.style500.copyWith(color: Colors.black),),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    model.discountPercent == null
                    ? Text("Đơn giá: ${(model.price * model.soluong).toPrice()}đ",style: StyleApp.style500.copyWith(color: Colors.red),)
                    : Text("Đơn giá: ${(model.price * model.soluong) * (100 - model.discountPercent!)~/100}đ",style: StyleApp.style500.copyWith(color: Colors.red),),
                    const Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          width:30,
                          child: const Icon(
                            Icons.indeterminate_check_box,
                            size: 28,
                            color: ColorApp.text,).onTap(ontap1),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: 40,
                            child: Text("$count",style: StyleApp.style600.copyWith(fontSize: 16),)),
                        SizedBox(
                          width: 30,
                          child: const Icon(
                            Icons.add_box,
                            size: 28,
                            color: ColorApp.text,).onTap(ontap2),
                        ),
                      ],
                    )
                  ],
                ),
              10.height
            ],
          ).expand()
        ],
      ),
    );
  }
}
