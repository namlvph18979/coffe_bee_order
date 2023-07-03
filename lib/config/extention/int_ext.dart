import 'package:intl/intl.dart';

extension numExt on num?{
  String toPrice(){
    if(this == null){
      return "0";
    }
    if((this ?? 0) < 0 ){
      return "0";
    }
    var formatCurrency = NumberFormat("#,###,###.##", "vi_VN");
    String format = formatCurrency.format(this);
    return format;
  }
}