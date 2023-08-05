import 'package:dio/dio.dart';
import 'package:enaya_doctor/common/model/base_respose_model.dart';
import 'package:enaya_doctor/common/model/network_exption_model.dart';
import 'package:enaya_doctor/common/model/network_request_model.dart';
import 'package:enaya_doctor/common/network_layer/network_request.dart';
import 'package:enaya_doctor/common/utils/constants/api_codes.dart';
import 'package:enaya_doctor/common/utils/enums/network_request_enum.dart';

class AppointmentRepo{
  Future<BaseResponsesModel> getDoctorWorkingTimes(int id) async {
    try {
      Response response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.DOCTORS_DATES_API+"/$id",
            networkType: NetworkRequestEnum.get,
            showProgress: true,
            dismissProgess: true,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true,
              showError: true
          )
      );
      return BaseResponsesModel.fromJson(response.data);
    } catch (error) {
      return BaseResponsesModel(status: 500, success: false, data: null, message: 'failed to connect');
    }
  }

}