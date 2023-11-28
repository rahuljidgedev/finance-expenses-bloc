import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import '../../data/remote/app_exception.dart';
import '../../data/remote/base_api_service.dart';
import 'package:http/http.dart' as http;


class NetworkApiService extends BaseApiService {

  @override
  Future getUserDataResponse(String url, String token) async {
    dynamic responseJson;
    try {
      var query = {
        "apiKey": apiKey,
        "token": token,
      };
      var uri = Uri.http(baseUrl, url, query);
      if (kDebugMode) {
        print(uri.toString());
        print(uri.queryParametersAll.toString());
      }
      final response = await http.get(uri);
      responseJson = returnResponse(response);

    } catch(e) {
      //await Future.delayed(const Duration(seconds: 3));
      if(e is AppException) {
        throw FetchDataException(e.toString());
      } else if(e is SocketException){
        throw FetchDataException("Socket Exception: ${e.toString()}");
      } else {
        throw FetchDataException("Something went wrong: ${e.toString()}");
      }
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        throw UnauthorisedException(responseJson['message']);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }

  @override
  Future getAllNewsPaginationResponse(String url, String countryCode, int pageSize, int page) async {
    dynamic responseJson;
    try {
        var query = {
          "apiKey": apiKey,
          "country": countryCode,
          "pageSize": pageSize.toString(),
          "page": page.toString()
        };
        var uri = Uri.http(baseUrl, url, query);
        if (kDebugMode) {
          print(uri.toString());
          print(uri.queryParametersAll.toString());
        }
        final response = await http.get(uri);
        responseJson = returnResponse(response);
    } catch(e) {
      if(e is AppException) {
        throw FetchDataException(e.toString());
      } else if(e is SocketException){
        throw FetchDataException("Socket Exception: ${e.toString()}");
      } else {
        throw FetchDataException("Something went wrong: ${e.toString()}");
      }
    }
    return responseJson;
  }

  @override
  Future getUserExpenseResponse(String url, String token) async {
    dynamic responseJson;
    try {
      var query = {
        "apiKey": apiKey,
        "token": token,
      };
      var uri = Uri.http(baseUrl, url, query);
      if (kDebugMode) {
        print(uri.toString());
        print(uri.queryParametersAll.toString());
      }
      final response = await http.get(uri);
      responseJson = returnResponse(response);

    } catch(e) {
      await Future.delayed(const Duration(seconds: 3));
      if(e is AppException) {
        throw FetchDataException(e.toString());
      } else if(e is SocketException){
        throw FetchDataException("Socket Exception: ${e.toString()}");
      } else {
        throw FetchDataException("Something went wrong: ${e.toString()}");
      }
    }
    return responseJson;
  }

}