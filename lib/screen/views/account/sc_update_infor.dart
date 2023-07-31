import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/local_bloc/choose_file_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/user/model/user_model.dart';
import 'package:coffe_bee_order/screen/widgets/image_network_view.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:coffe_bee_order/screen/widgets/item_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class ScreenUpdateInfor extends StatefulWidget {
  UserModel model;

  ScreenUpdateInfor({required this.model});

  @override
  State<ScreenUpdateInfor> createState() => _ScreenUpdateInforState();
}

class _ScreenUpdateInforState extends State<ScreenUpdateInfor> {
  String imgEmpty = "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg";
  final name = TextEditingController();
  final sdt = TextEditingController();
  final avatarBloc = ChooseFileBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemAppBar(
        title: "Cập nhật thông tin",
        isback: true,
        align: false,
      ),
      body: Column(
        children: [
          20.height,
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)),
            child: BlocBuilder<ChooseFileBloc, CubitState>(
              bloc: avatarBloc,
              builder: (context, state) {
                if (avatarBloc.file != null) {
                  return Image.file(
                    avatarBloc.file!,
                    fit: BoxFit.cover,
                  );
                }
                return ImageNetWorkView(
                    imageUrl: widget.model.image ?? imgEmpty,
                    fit: BoxFit.cover,
                    radius: BorderRadius.circular(5));
              },
            ),
          ).onTap(() {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: itemButton(
                            textBtn: "Mở thư viện",
                            onPress: () {
                              finish(context);
                              avatarBloc.chooseImgGl();
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: itemButton(
                            textBtn: "Mở máy ảnh",
                            onPress: () {
                              finish(context);
                              avatarBloc.chooseImgCM();
                            },
                          ),
                        ),
                      ],
                    ));
          }),
          50.height,
          itemInputText(
            type: TextFieldType.NAME,
            labeltext: widget.model.userName ?? "Name",
            hint: "Nhập tên mới",
            controller: name,
          ),
          10.height,
          itemInputText(
            type: TextFieldType.PHONE,
            labeltext: widget.model.phoneNumber ?? "Số điện thoại",
            hint: "Nhập sđt mới",
            controller: sdt,
          ),
        ],
      ).scrollView().paddingSymmetric(horizontal: 15, vertical: 15),
      bottomSheet: itemButton(
        textBtn: "Lưu",
        onPress: () {
          finish(context);
        },
      ).paddingSymmetric(horizontal: 10),
    );
  }
}
