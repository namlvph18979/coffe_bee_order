// import 'package:coffe_bee_order/config/extention/int_ext.dart';
// import 'package:coffe_bee_order/config/style_app/style_text.dart';
// import 'package:coffe_bee_order/data/cubit_state.dart';
// import 'package:coffe_bee_order/data/remote_bloc/category/catbloc.dart';
// import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
// import 'package:coffe_bee_order/screen/views/add_order/sc_create_order.dart';
// import 'package:coffe_bee_order/screen/views/sc_hoa_don/detail_invoice.dart';
// import 'package:coffe_bee_order/screen/widgets/dialog/confirm_dialog.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nb_utils/nb_utils.dart';
// import '../../../../config/style_app/color_app.dart';
//
// class CartBottomBar extends StatelessWidget {
//
//   final bloc = ListInvoiceBloc();
//
//   @override
//   Widget build(BuildContext context) {
//     final Listinvoice = context.read<ListInvoiceBloc>();
//     return Listinvoice.invoices.isNotEmpty
//         ? BlocBuilder<ListInvoiceBloc, CubitState>(
//             bloc: invoicebloc,
//             builder: (context, state) {
//               return BottomSheet(
//                   onClosing: () {},
//                   builder: (context) => Container(
//                         height: 50,
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 5),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             border:
//                                 Border.all(width: 1.5, color: ColorApp.text)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             BlocBuilder<ListCatbloc,CubitState>(
//                                 builder: (context, snapshot) {
//                                   return Badge.count(
//                                       count: Listinvoice.invoices.length,
//                                       isLabelVisible: Listinvoice.invoices.isNotEmpty,
//                                       textStyle: StyleApp.style400.copyWith(
//                                         fontSize: 10, color: Colors.white),
//                                     padding:
//                                     const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
//                                     alignment: const AlignmentDirectional(15, -5),
//                                     child: const Icon(
//                                       CupertinoIcons.shopping_cart,
//                                       color: ColorApp.text,
//                                     ),
//                                   );
//                                 },
//                             ),
//                             Text(
//                               "Tổng: ${Listinvoice.totalPrice.toPrice()})}đ",
//                               style:
//                                   StyleApp.style600.copyWith(color: Colors.red),
//                               textAlign: TextAlign.center,
//                             ).expand(flex: 4),
//                             Container(
//                               color: ColorApp.text,
//                               height: double.infinity,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "Xác Nhận",
//                                 style: StyleApp.style700
//                                     .copyWith(color: Colors.white),
//                               ),
//                             ).onTap(() {
//                               // if (modelInvoice.listSp!.isEmpty) {
//                               //   toast("Chưa có sản phẩm nào");
//                               //   return;
//                               // }
//                               // showInDialog(context,
//                               //     builder: (p0) => ConfirmDialog(
//                               //           title: "Thanh toán",
//                               //           des: "Vui lòng chọn kiểu thanh toán",
//                               //           text1: "Trước",
//                               //           text2: "Sau",
//                               //           ontap1: () {
//                               //             finish(context);
//                               //             // ScreenPrintinvoice(model: modelInvoice)
//                               //             //     .launch(context);
//                               //           },
//                               //           ontap2: () {
//                               //             finish(context);
//                               //             finish(context);
//                               //             modelInvoice.listSp!.clear();
//                               //             modelInvoice.idfloor == null;
//                               //             modelInvoice.idTable == null;
//                               //             modelInvoice.timeIn == null;
//                               //
//                               //             toast("Gửi đơn thành công",
//                               //                 bgColor: ColorApp.text);
//                               //           },
//                               //         ));
//                             }).expand(flex: 2)
//                           ],
//                         ),
//                       ).onTap(() {
//                         ScreenDetailInvoice(
//                           model: ,
//                           isWatch: false,
//                         ).launch(context);
//                       }));
//             },
//           )
//         : const SizedBox();
//   }
// }
