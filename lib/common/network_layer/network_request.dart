import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:enaya_doctor/common/model/network_exption_model.dart';
import 'package:enaya_doctor/common/model/network_request_model.dart';
import 'package:enaya_doctor/common/network_layer/network_exeption_handler.dart';
import 'package:enaya_doctor/common/utils/constants/api_codes.dart';
import 'package:enaya_doctor/common/utils/constants/app_data.dart';
import 'package:enaya_doctor/common/utils/enums/network_request_enum.dart';
import 'package:enaya_doctor/common/widgets/custom_snakbar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class NetworkRequest with NetworkExceptionHandler{
  static NetworkRequest? _instance;

  NetworkRequest._internal();

  factory NetworkRequest() {
    _instance = _instance ?? NetworkRequest._internal();
    return _instance!;
  }

  Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiBaseUrl.SERVER_DEV,
        sendTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        connectTimeout: Duration(seconds: 30),
      )
  );

  Future sendAppRequest({required NetworkRequestModel networkParameters,required NetworkExceptionModel exceptionParameters}) async {
    if(networkParameters.showProgress) {
      EasyLoading.show();
    }

    log("******Request************(serviceId:${networkParameters.apiCode})\n${networkParameters.data!=null?json.encode(networkParameters.data):{}}");
    log("******Request************(serviceId:${networkParameters.apiCode})\n${networkParameters.queryParameters!=null?json.encode(networkParameters.queryParameters):{}}");

    try {
      final Response response = await dio.request(
        networkParameters.apiCode,
        queryParameters: networkParameters.queryParameters,
        data: networkParameters.data,
        options: Options(
            headers: {
              'Authorization':"Bearer ${AppConstants.prefs.get("token")??""}"
            },
            method: networkParameters.networkType.value
        ),
      );
      log("******Response************(serviceId:${networkParameters.apiCode})\n${response}");

      if(networkParameters.dismissProgess) {
        EasyLoading.dismiss();
      }

      return response;
    }on DioError catch (dioError) {
      log("******Error************(serviceId:${networkParameters.apiCode})*****(statusCode:${dioError.response?.statusCode}:${dioError.response?.statusMessage})\n${dioError.response}");

      if(exceptionParameters.dismissProgress){
        EasyLoading.dismiss();
      }

      final String errorMessage = dioErrorHandler(dioError: dioError,exceptionModel: exceptionParameters);
      if(exceptionParameters.showError){
        CustomSnakbar().appSnackBar(text: errorMessage,isFaild: true);
      }

      if(networkParameters.rethrowError){
        rethrow;
      }
      log("******Error************(serviceId:${networkParameters.apiCode})\nError Message :${errorMessage}\nStatus code :${dioError.response?.statusCode??0}\n${jsonEncode(dioError.response?.data??{})}");
    }
  }





}