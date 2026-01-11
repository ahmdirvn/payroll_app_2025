import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:payroll_app/data/app_exception.dart';
import 'package:payroll_app/data/network/base_api_service.dart';
import 'package:payroll_app/shared/shared.dart';

class NetworkApiService implements BaseApiService {
  @override
  Future<dynamic> getApiResponse(String endpoint) async {
    // Implement your GET request logic here
    dynamic responseJson;

    try {
      // Simulate network call
      final response = await http
          .get(
            Uri.https(Const.baseUrl, Const.subUrl + endpoint),
            // headers: {'Content-Type': 'application/json', 'key': Const.apiKey},
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        responseJson = jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw fetchDataException();
    }
  }

  //crate login post method
  @override
  Future<dynamic> postApiResponse(String endpoint, dynamic data) async {
    // Implement your POST request logic here
    dynamic responseJson;

    try {
      final response = await http
          .post(
            Uri.http(Const.baseUrl, Const.subUrl + endpoint),
            headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw fetchDataException("Request timeout");
    }

    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      default:
        throw fetchDataException('Error occured with status code : ${response.statusCode}');
    }
  }
}
