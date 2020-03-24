import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:notes_rea/Modules/Service/ApiResponse.dart';
import 'package:notes_rea/Modules/Service/AppException.dart';

abstract class ApiBase {
  final String url;
  ApiBase({this.url});

  Future<dynamic> get(params) async {
    final headers = {};
    try {
      final response = await http.get(url + params, headers: headers);
      final ApiResponse responseJson = _proceesRequest(response);
      return responseJson;
    } on SocketException {
      FetchDataException("Not Internet connections");
    } catch (error) {
      ApiResponse.error(error.toString());
    }
  }

  Future<dynamic> post(params) async {
    final headers = {};

    try {
      final response = await http.post(url + params, headers: headers);
      final ApiResponse responseJson = _proceesRequest(response);
      return responseJson;
    } on SocketException {
      FetchDataException("Not Internet connections");
    } catch (error) {
      ApiResponse.error(error.toString());
    }
  }

  ApiResponse _proceesRequest(http.Response response) {
    ApiResponse apiresponse = ApiResponse.error(response.body.toString());

    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.body != null && response.body.length > 0
            ? json.decode(response.body)
            : "";
        apiresponse = ApiResponse.completed(data);
        break;

      case HttpStatus.badRequest:
        BadRequestException(response.body.toString());
        break;

      case HttpStatus.unauthorized:
        UnauthorisedException(response.body.toString());
        break;

      case HttpStatus.forbidden:
        UnauthorisedException(response.body.toString());
        break;

      case HttpStatus.notFound:
        apiresponse = ApiResponse.error(response.body.toString());
        break;

      case HttpStatus.internalServerError:
        UnauthorisedException(response.body.toString());
        break;

      default:
        throw FetchDataException("Something wend wrong");
    }
    return apiresponse;
  }
}
