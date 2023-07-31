import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/table/model/Table_model.dart';
import 'package:coffe_bee_order/data/remote_bloc/table/table_bloc.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:coffe_bee_order/screen/widgets/item_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/style_app/color_app.dart';

class ScreenGhepBan extends StatefulWidget {
  List<TableModel> listModel;

  ScreenGhepBan({required this.listModel});

  @override
  State<ScreenGhepBan> createState() => _ScreenGhepBanState();
}

class _ScreenGhepBanState extends State<ScreenGhepBan> {

  int? isdrag1;
  int? isdrag2;

  final player = AudioPlayer();
  final tablebloc = TableBloc();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: itemAppBar(
            title: "Ghép bàn",
            align: false,
            isback: true,
            actions: [
              Align(
                  alignment: Alignment.centerRight,
                  child: ItemtoolTip(
                    toolText: toolText,
                  )
              ).paddingRight(20),
            ],
        ),
      body: Column(
          children: [
            20.height,
            Align(alignment: Alignment.centerLeft,
                child: Text("Vui lòng chọn cặp bàn muốn ghép!",style: StyleApp.style600.copyWith(fontSize: 18),)
            ).paddingLeft(10),
            20.height,
            Row(
              children: [
                Text("Bàn số 1",style: StyleApp.style600,textAlign: TextAlign.center,).expand(),
                Text("Bàn số 2",style: StyleApp.style600,textAlign: TextAlign.center).expand(),
              ],
            ).paddingSymmetric(horizontal: 20,vertical: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DragTarget<int>(
                  onAccept: (data1) => setState(() {
                    if(data1 == isdrag2){
                      toast("không thể gép 2 bàn trùng nhau!",);
                      player.play(AssetSource('sound/erro.mp3'),volume: SizeConfig.screenHeight);
                      return;
                    }
                    isdrag1 = data1;
                  }),
                  builder: (context,_,__) => isdrag1 == null
                      ? ItemEmpty()
                      : itemDragTable(model: widget.listModel[isdrag1!-1])
                ).expand(),
                const Icon(Icons.link_outlined,size: 25,color: Colors.black54,).paddingSymmetric(horizontal: 20),
                DragTarget<int>(
                    onAccept: (data2) => setState(() {
                      if(data2 == isdrag1){
                          toast("không thể gép 2 bàn trùng nhau!",);
                          player.play(AssetSource('sound/erro.mp3'),volume: SizeConfig.screenHeight);
                          return;
                      }
                      isdrag2 = data2;
                    }),
                    builder: (context,_,__) => isdrag2 == null
                        ? ItemEmpty()
                        : itemDragTable(model: widget.listModel[isdrag2!-1])
                ).expand(),
              ],
            ).paddingSymmetric(horizontal: 35),
            10.height,
            Column(
              children: [
                const Divider(thickness: 1.5,color: ColorApp.text,),
                GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    clipBehavior: Clip.hardEdge,
                    scrollDirection: Axis.horizontal,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    children: List.generate(
                        widget.listModel.length,
                        (index) => DragItem(
                          model: widget.listModel[index],
                        )),
                ).withHeight(400),
              ],
            )
          ],
      ).scrollView(),
      bottomSheet: Row(
        children: [
          itemButton(
              textBtn: "Huỷ".toUpperCase(),
              onPress: () {finish(context);},
          ).expand(),
          itemButton(
            textBtn: "Gép".toUpperCase(),
            onPress: () {
              if(isdrag1 != null && isdrag2 != null){
                List<int> list = [isdrag1!,isdrag2!];
                  finish(context,list);
              }
              return;
            }).expand(),

        ],
      ),
    );
  }

  Widget DragItem({TableModel? model}){
    return Draggable <int>(
        data: model!.id.toInt(),
        feedback: itemDragTable(model: model),
        childWhenDragging: itemDragTable(model: model).visible(false),
      child: itemDragTable(model: model),
    );
  }

  Widget ItemEmpty(){
    return DottedBorderWidget(
        color: Colors.black54,
        radius: 5,
        child:const SizedBox(
          height: 130,
          width: 130,
          child: Icon(Icons.add,size: 35,color: ColorApp.text,),
        )
    );
  }

  Widget itemDragTable({TableModel? model}){
    return Container(
      width: 130,
      height: 130,
      padding:const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorApp.bg,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
            color: model?.isActive == "1" ? Colors.green : ColorApp.text,
            width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Bàn ${model?.name}" ,style: StyleApp.style600.copyWith(fontSize: 16),),
          model?.isActive == "1"
              ? Text("Đang trống",style: StyleApp.style500.copyWith(fontSize: 12,color: Colors.green),)
              : AnimatedTextKit(
                isRepeatingAnimation: true,
                repeatForever: true,
                pause:const Duration(milliseconds: 100),
                animatedTexts: [
                  WavyAnimatedText("Đang hoạt động...",
                    textStyle: StyleApp.style500.copyWith(fontSize: 9))
              ]),
        ],
      ),
    );
  }
}

String toolText = "bạn có thể kéo thả các bàn phía bên dưới vào 2 ô trống phía "
    "trên. Lưu ý chỉ có thể gép tối đa 2 bàn\n"
    "Quy định ghép bàn:\n"
    "- Không yêu cầu ghép khi chưa được cho phép\n"
    "- Không ghép nếu không cần thiết\n"
    "- Giá trị hoá đơn 2 bàn sẽ dược gộp chung\n"
    "- Bàn sẽ không thể tách khi đã ghép\n"
    "- Chỉ có thể chọn 1 lần cho mỗi bàn";
