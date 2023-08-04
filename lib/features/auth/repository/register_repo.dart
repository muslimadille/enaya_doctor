import 'package:dio/dio.dart';
import 'package:enaya_doctor/common/model/base_respose_model.dart';
import 'package:enaya_doctor/common/model/network_exption_model.dart';
import 'package:enaya_doctor/common/model/network_request_model.dart';
import 'package:enaya_doctor/common/network_layer/network_request.dart';
import 'package:enaya_doctor/common/utils/constants/api_codes.dart';
import 'package:enaya_doctor/common/utils/enums/network_request_enum.dart';
import 'package:enaya_doctor/features/auth/model/register_request_model.dart';

class RegisterRepo{
  Future<BaseResponsesModel> doctorRegister({required RegisterRequestModel model}) async {
    try {
      Response response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
              apiCode: ApiCodes.DOC_REGISTER_API,
              networkType: NetworkRequestEnum.post,
              showProgress: true,
              dismissProgess: true,
              data:{
           "phonenumber":model.phonenumber,
           "password":model.password,
           "country_id":model.country_id,
           "email":model.email,
           "gender_id":model.gender_id,
           "featured":model.featured,
           "firstName_ar":model.firstName_ar,
           "firstName_en":model.firstName_en,
           "lastName_ar":model.lastName_ar,
           "lastName_en":model.lastName_en,
              }
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