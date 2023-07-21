import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:enaya_doctor/common/model/network_exption_model.dart';
import 'package:enaya_doctor/common/model/response_exption.dart';

mixin NetworkExceptionHandler {

  dioErrorHandler({required DioError dioError,required NetworkExceptionModel exceptionModel}) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        return "Request to API server was cancelled";
      case DioErrorType.connectionTimeout:
        return 'connection_timeout';
    // return "Connection timeout with API server";
      case DioErrorType.receiveTimeout:
        return 'connection_timeout';
    // return "Receive timeout in connection with API server";
      case DioErrorType.sendTimeout:
        return 'connection_timeout';
    // return "Send timeout in connection with API server";
      case DioErrorType.badResponse:
        return _handleStatusCodeError(
          dioError.response?.statusCode??0,
          dioError,
        );
      case DioErrorType.unknown:
        if (dioError.message.toString().contains("SocketException")) {
          return 'No Internet';
        }
        return 'unkown_error';
    // return "Unexpected error occurred";
      default:
        return 'unkown_error';
    // return "Something went wrong";
    }
  }

  String _handleStatusCodeError(int statusCode, DioError responseError) {
    ResponseException error=responseError.response?.data is String
        ?responseExceptionFromJson(responseError.response!.data.toString().isNotEmpty?responseError.response?.data:"{}")
        :responseExceptionFromJson(jsonEncode(responseError.response?.data??{}));
    if(error.data.errorCode.isNotEmpty){
      return _handleBusinessCodeError(error);
    }else if(error.data.message.isNotEmpty){
      return error.data.message;
    } else {
      switch (statusCode) {
        case 400:
          return 'Bad request';
        case 401:
          return 'Unauthorized';
        case 403:
          return 'Forbidden';
        case 404:
          return 'Not found';
        case 500:
          return 'Internal server error';
        case 502:
          return 'Bad gateway';
        default:
          return 'unkown_error';
      // return 'Oops something went wrong';
      }
    }
  }

  String _handleBusinessCodeError(ResponseException exception){
    return exception.data.message;
  }

}