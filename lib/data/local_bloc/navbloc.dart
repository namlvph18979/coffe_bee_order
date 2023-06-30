import 'package:flutter_bloc/flutter_bloc.dart';

class NavBloc extends Cubit<int>{

  NavBloc():super(0);

  change(int index){
    emit(index);
  }

}