import 'package:audioplayers/audioplayers.dart';
import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/detail_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class ScreenPrintinvoice extends StatefulWidget {
  ModelInvoice model;

  ScreenPrintinvoice({required this.model});

  @override
  State<ScreenPrintinvoice> createState() => _ScreenPrintinvoiceState();
}

class _ScreenPrintinvoiceState extends State<ScreenPrintinvoice> {

  final invoiceBLoc = DetailInvoiceBloc();
  int priceAll = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    String timeout = DateFormat("hh:mm a").format(DateTime.now());

    return BlocBuilder<DetailInvoiceBloc, CubitState>(
      bloc: invoiceBLoc,
      builder: (context, state) {
        for(int i = 0; i< widget.model.listSp!.length;i++){
          if(widget.model.listSp![i].discountPercent != null){
            priceAll += ((widget.model.listSp![i].price * widget.model.listSp![i].soluong)
                * (100 - widget.model.listSp![i].discountPercent!)~/100);
          }else{
            priceAll += (widget.model.listSp![i].price * widget.model.listSp![i].soluong);
          }
        }
        return Scaffold(
          appBar: itemAppBar(
            title: "Hoá đơn",
            isback: true,
            align: true,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tầng: ${widget.model.idfloor}",
                          style: StyleApp.style500,
                        ),
                        5.height,
                        Text(
                          "Bàn số: ${widget.model.idTable}",
                          style: StyleApp.style500,
                        ),
                      ],
                    ).paddingLeft(40).expand(flex: 1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Giờ vào: ${widget.model.timeIn}",
                          style: StyleApp.style500,
                        ),
                        5.height,
                        Text(
                          "Giờ ra: $timeout",
                          style: StyleApp.style500,
                        ),
                      ],
                    ).paddingRight(40).expand(flex: 1),
                  ],
                ),
                20.height,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nv phụ trách: ${widget.model.user!.userName}",
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
                      widget.model.listSp!.length,
                      (index) => buildRow([
                            widget.model.listSp![index].name,

                            "${widget.model.listSp![index].discountPercent != null
                                ? (widget.model.listSp![index].price * (100 - widget.model.listSp![index].discountPercent!)~/100).toPrice()
                                : (widget.model.listSp![index].price).toPrice()}đ",

                            "${widget.model.listSp![index].soluong}",

                        "${widget.model.listSp![index].discountPercent != null
                            ? ((widget.model.listSp![index].price * widget.model.listSp![index].soluong)
                                          * (100 - widget.model.listSp![index].discountPercent!)~/100).toPrice()
                            : (widget.model.listSp![index].price * widget.model.listSp![index].soluong).toPrice()}đ",
                          ])),
                ),
                Table(border: TableBorder.all(), children: [
                  TableRow(children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Thanh toán: ${priceAll.toPrice()}đ",
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
          bottomSheet: itemButton(
            textBtn: "in hóa đơn".toUpperCase(),
            width: MediaQuery.of(context).size.width,
            onPress: () {
              player.play(AssetSource('sound/cash_pay.mp3'),
                  volume: SizeConfig.screenHeight);
              finish(context);
              finish(context);
            },
          ),
        );
      },
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
