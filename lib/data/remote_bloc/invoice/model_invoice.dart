import '../product/product_model.dart';
import '../user/user_model.dart';

class ModelInvoice{
  int id;
  String? timeIn;
  String? timeout;
  int? price;
  List<ModelPro>? listSp;
  int? type;
  int? Discount;
  int? idTable;
  int? idfloor;
  bool? isDone;
  UserModel? user;

  ModelInvoice({
     required this.id,
     this.timeIn,
     this.timeout,
     this.price,
     this.listSp,
     this.type = 0,
     this.Discount,
     this.idTable,
     this.idfloor,
     this.isDone = false,
     this.user
  });

}