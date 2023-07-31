import 'package:nb_utils/nb_utils.dart';

class DBKeyLocal{
  static const String user = '/user';

  static remover() async {
    await removeKey(user);
  }
}