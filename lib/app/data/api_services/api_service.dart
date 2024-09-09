import 'dart:developer';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/constants.dart';


enum RequestType {get,post}

enum ApiResponse { success, fail }

final localData = GetStorage();

class ApiService {
  static Future<ResponseData> apiRequest({required String url, bool? isNotBaseUrl, String? postMessage, required RequestType requestType, Object? body, RxBool? isLoading}) async {
    try {
      isLoading?.value = true;
      String baseUrl = "https://jsonplaceholder.typicode.com/$url";
      log(baseUrl);
      final response = await _sendRequest(baseUrl, requestType, body).timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        var jsonResponse;
        if (response.data is Map<String, dynamic>) {
          jsonResponse = response.data;
        } else if (response.data is List) {
          jsonResponse = {"data": response.data};
        } else {
          jsonResponse = {};
        }
        return ResponseData(
            statusCode: response.statusCode!,
            jsonBody: jsonResponse,
            message: "",
            response: ApiResponse.success);
      }
      else {
        Constants.showErrorToast(msg: "Please try after sometime", title: "Unknown Error Occur ${response.statusCode!}");
        return ResponseData(
            statusCode: response.statusCode!,
            jsonBody: response.data,
            message: response.data,
            response: ApiResponse.fail);
      }
    } catch (e) {
      Constants.showErrorToast(msg: "Couldn't fetch data");
      return ResponseData(statusCode: 500, jsonBody: {}, message: e.toString(), response: ApiResponse.fail);
    } finally {
      isLoading?.value = false;
    }
  }

  static Future<d.Response<dynamic>> _sendRequest(String url, RequestType requestType, Object? body) async {
    final dio = d.Dio();
    switch (requestType) {
      case RequestType.get:
        return dio.get(url);
      case RequestType.post:
        return dio.post(url, data: body);
    }
  }
}

class ResponseData {
  final int statusCode;
  final Map<String, dynamic> jsonBody;
  final String message;
  final ApiResponse response;

  ResponseData({
    required this.statusCode,
    required this.jsonBody,
    required this.message,
    required this.response,
  });
}
