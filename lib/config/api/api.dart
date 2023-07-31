import 'package:coffe_bee_order/config/api/api_path.dart';
import 'package:dio/dio.dart';

final dio = Dio()..interceptors.add(
    InterceptorsWrapper(
            onRequest: (options, handler) async {
              return handler.next(options);
              },
            onResponse: (Response? response, handler) {
              return handler.next(response!);
            },
            onError: (e, handler) {
                String err;
                if(e.response == null){
                  err = "Kết nối máy chủ thất bại";
                }else if(e.response?.statusCode == 400){
                  err = "Lỗi cú pháp";
                }else if(e.response?.statusCode == 404){
                  err = "Không tìm thấy tài nguyên";
                }else if(e.response?.statusCode == 400){
                  err = "Có lỗi hệ thông vui long thử lại";
                }else{
                  err = e.response?.data['message'] ?? e.message;
                }
              return handler.next(
                DioError(
                    requestOptions: e.requestOptions,
                    type: e.type,
                    error: err,
                    response: e.response,
                    message: err,
                )
              );
            },
    )
);

class Api {
  static getAsync({
    required String endpoint,
    bool isToken = true,
    Map<String,dynamic>? headers,
    Map<String,dynamic>? req,
    bool hasForm = false,
}) async {
  try{
        Map<String, dynamic> headersData = Map();
        headersData['Content-Type'] = "application/json";

        var res = await dio.get(
            ApiPath.BASE_URL + endpoint,
            options: Options(
              headers: headers ?? headersData
            ),
            data: hasForm && req != null ? FormData.fromMap(req) : req,
        );
        return res.data;
  } catch(e){
    rethrow;
  }
  }

  static postAsync({
    required String endpoint,
    required Map<String, dynamic> req,
    bool isForm = false
}) async {
    try{
      Map<String ,dynamic> headersData = Map();
      headersData['Content-Type'] = "application/json";
      FormData formData = FormData.fromMap(req);

      var res = await dio.post(
        ApiPath.BASE_URL + endpoint,
        data: isForm ? formData : req,
        options: Options(
          headers: headersData
        )
      );
      return res.data;
    }catch (e){
      rethrow;
    }
  }

  static putAsync({
    required String endpoint,
    required Map<String,dynamic> req,

}) async {
    try{
        var res = await dio.put(
          ApiPath.BASE_URL + endpoint,
          data: req ,
        );
        return res.data;
    }catch(e){
      rethrow;
    }
  }

  static deleteAsync({
    required String endpoint,
    Map<String,dynamic>? headers,
}) async {
    try{
      Map<String ,dynamic> headersData = Map();
      headersData['Content-Type'] = "application/json";

      var res = await dio.delete(
        ApiPath.BASE_URL + endpoint,
        options: Options(
          headers: headers ?? headersData
        )
      );
      return res.data;
    }catch (e){
      rethrow;
    }
}

  static String checkError(error){
      if(error is DioError){
          return error.message ?? "Có lỗi hệ thống. Vui lòng thử lại";
      }else{
        return error.toString();
      }
  }
}