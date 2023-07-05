import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit_state.dart';


class DetailInvoiceBloc extends Cubit<CubitState>{
  DetailInvoiceBloc() : super(CubitState());

  ModelInvoice model = ModelInvoice();




}