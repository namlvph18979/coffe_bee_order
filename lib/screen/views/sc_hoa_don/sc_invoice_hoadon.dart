
import 'package:coffe_bee_order/config/extention/int_ext.dart';
import 'package:coffe_bee_order/config/extention/show_bottom_sheet.dart';
import 'package:coffe_bee_order/config/style_app/color_app.dart';
import 'package:coffe_bee_order/config/style_app/style_text.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/params/param_create_invoice.dart';
import 'package:coffe_bee_order/screen/views/sc_hoa_don/sc_print_invoice.dart';
import 'package:coffe_bee_order/screen/widgets/item_appbar.dart';
import 'package:coffe_bee_order/screen/widgets/item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';



class ScInvoiceHoaDon extends StatefulWidget {

  ScInvoiceHoaDon();

  @override
  State<ScInvoiceHoaDon> createState() => _ScInvoiceHoaDonState();
}

class _ScInvoiceHoaDonState extends State<ScInvoiceHoaDon> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final param = context.read<ListInvoiceBloc>().param;
    return Scaffold(
      appBar: itemAppBar(
        title: "Hoá đơn bàn ${param.id_Table ?? ""}",
        align: false,
        isback: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Thông tin chi tiết",
                  style: StyleApp.style700
                      .copyWith(color: Colors.black, fontSize: 16),
                ),
                15.height,
                itemText(
                    title: "Tầng số:  ",
                    des: param.id_tang.toString() ?? "Đang cập nhật"),
                8.height,
                itemText(
                    title: "Bàn số:  ",
                    des: param.id_Table.toString() ?? "Đang cập nhật"),
                8.height,
                itemText(
                    title: "Tổng tiền:  ",
                    des: "${param.tongTien.toPrice()}đ"),
                8.height,
                itemText(
                    title: "Trạng thái:  ",
                    des: "Chưa thanh toán"),
                8.height,
                itemText(
                    title: "Nv phụ trách:  ",
                    des: "${context.read<ListInvoiceBloc>().user.fullName.validate()}"),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Giờ vào: ${param.time_in.validate() ?? "Chưa cập nhật"}",
                        style: StyleApp.style400.copyWith(fontSize: 12)),
                    15.width,
                    Text(
                        "Giờ ra: Chưa cập nhật",
                        style: StyleApp.style400.copyWith(fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: ColorApp.text,width: 0.8)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tên:  ${context.read<ListInvoiceBloc>().items[index].tenSp.validate()}",style: StyleApp.style600.copyWith(fontSize: 14,color: ColorApp.text),maxLines: 1,overflow: TextOverflow.ellipsis,),2.height,
                    Text("SL:  ${context.read<ListInvoiceBloc>().items[index].soLuong.validate()}",style: StyleApp.style600.copyWith(fontSize: 14,color: ColorApp.text),),2.height,
                    Text("Giá:  ${context.read<ListInvoiceBloc>().items[index].giaSp?.toInt().toPrice()}đ",style: StyleApp.style600.copyWith(fontSize: 14,color: ColorApp.text),),2.height,
                    context.read<ListInvoiceBloc>().items[index].ghiChu.validate().isNotEmpty
                        ? Text("Lưu ý: ${context.read<ListInvoiceBloc>().items[index].ghiChu.validate(value: "")}",style: StyleApp.style600.copyWith(fontSize: 14,color: ColorApp.text),)
                        : const SizedBox()
                  ],
                ),
              ),
              separatorBuilder: (context, index) => 8.height,
              itemCount: context.read<ListInvoiceBloc>().items.length),
          70.height,
        ],
      ).scrollView(),
      bottomSheet: Row(
        children: [
           itemButton(
            textBtn: "Huỷ đơn",
            onPress: () {
              finish(context);
              finish(context);
            },
          ).expand(),
          itemButton(
            textBtn: "Thanh toán",
            onPress: () {
              ScreenPrintinvoice(
                items: context.read<ListInvoiceBloc>().items,
                param: context.read<ListInvoiceBloc>().param,
              ).launch(context);
            },
          ).expand(),
        ],
      ),
    );
  }

  Widget itemText({String? title, String? des}) {
    return RichText(
        text: TextSpan(children: [
          TextSpan(
              text: title, style: StyleApp.style600.copyWith(color: Colors.black)),
          TextSpan(text: des, style: StyleApp.style600.copyWith(color: Colors.red)),
        ]));
  }
}
