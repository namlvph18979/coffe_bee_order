import 'package:audioplayers/audioplayers.dart';
import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/image_path.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/check_state.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';

import 'package:coffe_bee_order/screen/widgets/custom_button.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class ScreenPrintinvoice extends StatefulWidget {
  ScreenPrintinvoice();

  @override
  State<ScreenPrintinvoice> createState() => _ScreenPrintinvoiceState();
}

class _ScreenPrintinvoiceState extends State<ScreenPrintinvoice> {
  final bloc = ListInvoiceBloc();

  @override
  void initState() {
    super.initState();
  }


  sendHD() {
    bloc.param = context.read<ListInvoiceBloc>().param;
    bloc.createHoaDon();
  }

  @override
  Widget build(BuildContext context) {



    final player = AudioPlayer();
    return Scaffold(
      appBar: itemAppBar(
        title: "Hoá đơn",
        isback: true,
        align: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //     image: DecorationImage(image: AssetImage(ImagePath.logo),fit: BoxFit.cover,opacity: 0.25,)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            15.height,
            Text(
              "Coffee Bee Order".toUpperCase(),
              style: StyleApp.style600
                  .copyWith(fontSize: 25, wordSpacing: 6, letterSpacing: 3),
              textAlign: TextAlign.center,
            ),
            10.height,
            Text(
              "Số 18, Trịnh Văn Bô, Phương Canh, Nam Từ Liêm, Hà Nội",
              style: StyleApp.style400,
              textAlign: TextAlign.center,
            ),
            20.height,
            Text(
              "Phiếu Thanh Toán",
              style: StyleApp.style600.copyWith(fontSize: 23),
              textAlign: TextAlign.center,
            ),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextRow(
                        title: "Tầng số",
                        data: context.read<ListInvoiceBloc>().param.id_tang.toString()),
                    5.height,
                    TextRow(
                        title: "Bàn số",
                        data: context
                            .read<ListInvoiceBloc>()
                            .param
                            .id_Table
                            .toString()),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextRow(
                        title: "Giờ vào",
                        data: context.read<ListInvoiceBloc>().param.time_in),
                    5.height,
                    TextRow(title: "Giờ ra", data: "Đang cập nhật"),
                  ],
                ),
              ],
            ),
            20.height,
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nv phụ trách: ${context.watch<ListInvoiceBloc>().user.fullName.validate(value: "Đang cập nhật")}",
                  style: StyleApp.style500.copyWith(fontSize: 13),
                )),
            5.height,
            Table(
              border: TableBorder.all(width: 1),
              columnWidths: const {
                0: FractionColumnWidth(0.4),
                1: FractionColumnWidth(0.25),
                2: FractionColumnWidth(0.1),
                3: FractionColumnWidth(0.25),
              },
              children: [
                buildRow(["Tên Sản Phẩm", "Đơn giá", "SL", "Thành tiền"],
                    isheader: true),
              ],
            ),
            Table(
              border: const TableBorder(
                  verticalInside: BorderSide(),
                  right: BorderSide(),
                  left: BorderSide()),
              columnWidths: const {
                0: FractionColumnWidth(0.4),
                1: FractionColumnWidth(0.25),
                2: FractionColumnWidth(0.1),
                3: FractionColumnWidth(0.25),
              },
              children: List.generate(
                  context.read<ListInvoiceBloc>().items.length,
                  (index) => buildRow([
                        context
                            .read<ListInvoiceBloc>()
                            .items[index]
                            .tenSp
                            .validate(),
                        "${context.read<ListInvoiceBloc>().items[index].giaSp.toPrice()}đ",
                        "${context.read<ListInvoiceBloc>().items[index].soLuong}",
                        "${((context.read<ListInvoiceBloc>().items[index].soLuong).validate() * (context.read<ListInvoiceBloc>().items[index].giaSp).validate()).toPrice()}đ"
                      ])),
            ),
            Table(border: TableBorder.all(), children: [
              TableRow(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Thanh toán: ${context.read<ListInvoiceBloc>().param.tongTien.toPrice()}đ",
                        style: StyleApp.style600.copyWith(fontSize: 16),
                      ),
                      20.height,
                      Text(
                        "Chúc quý khách vui vẻ, hẹn gặp lại!",
                        style: StyleApp.style400
                            .copyWith(fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                )
              ])
            ]),
          ],
        ).scrollView(),
      ),
      bottomSheet: BlocConsumer<ListInvoiceBloc, CubitState>(
        bloc: bloc,
        listener: (context, state) {
          CheckStateBloc.checkNoLoad(
            context,
            state,
            msg: state.msg,
            isShowMsg: true,
            success: () {
              player.play(AssetSource('sound/cash_pay.mp3'),
                  volume: SizeConfig.screenHeight);
              finish(context);
              finish(context);
              finish(context);
            },
          );
        },
        builder: (context, state) {
          return CustomButton(
                  title: "In hoá đơn".toUpperCase(),
                  color: ColorApp.text,
                  textColor: Colors.white,
                  isLoad: state.status == BlocStatus.loading,
                  onTap: sendHD)
              .withWidth(double.infinity)
              .paddingSymmetric(horizontal: 10, vertical: 5);
        },
      ),
    );
  }

  Widget TextRow({String? title, String? data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title!,
          style: StyleApp.style500.copyWith(color: ColorApp.text),
        ).withWidth(60),
        Text(
          ": ${data.validate()}",
          style: StyleApp.style500.copyWith(color: ColorApp.text),
        ),
      ],
    );
  }

  TableRow buildRow(List<String> cells, {bool isheader = false}) => TableRow(
      children: cells
          .map((cells) => Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                cells,
                style: isheader ? StyleApp.style600 : StyleApp.style400,
              )))
          .toList());
}
