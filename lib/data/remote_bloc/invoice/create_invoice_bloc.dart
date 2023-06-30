import 'package:coffe_bee_order/data/cubit_state.dart';
import 'package:coffe_bee_order/data/enum/blocstatus.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/model_invoice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateInvoiceBloc extends Cubit<CubitState>{
  CreateInvoiceBloc():super(CubitState());


  createInvoice(ModelInvoice model){
    emit(state.copyWith(status: BlocStatus.loading));

  }

}