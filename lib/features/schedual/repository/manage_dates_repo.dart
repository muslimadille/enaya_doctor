
import 'package:dio/dio.dart';
import 'package:enaya_doctor/common/model/base_respose_model.dart';
import 'package:enaya_doctor/common/model/network_exption_model.dart';
import 'package:enaya_doctor/common/model/network_request_model.dart';
import 'package:enaya_doctor/common/network_layer/network_request.dart';
import 'package:enaya_doctor/common/utils/constants/api_codes.dart';
import 'package:enaya_doctor/common/utils/enums/network_request_enum.dart';

import '../model/working_day_model.dart';

class ManageDatesRepo{
  Future<BaseResponsesModel> getDoctorWorkingTimes() async {
    try {
      Response response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_DOCTOR_WORKING_HOURS,
            networkType: NetworkRequestEnum.get,
            showProgress: false,
            dismissProgess: false,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: false,
              showError: true
          )
      );
      return BaseResponsesModel.fromJson(response.data);
    } catch (error) {
      return BaseResponsesModel(status: 500, success: false, data: null, message: 'failed to connect');
    }
  }
  Future<BaseResponsesModel> getDoctorVacations() async {
    try {
      Response response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_DOCTOR_VACATIONS,
            networkType: NetworkRequestEnum.get,
            showProgress: false,
            dismissProgess: false,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: false,
              showError: true
          )
      );
      return BaseResponsesModel.fromJson(response.data);
    } catch (error) {
      return BaseResponsesModel(status: 500, success: false, data: null, message: 'failed to connect');
    }
  }
  Future<BaseResponsesModel> getAllTimes() async {
    try {
      Response response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_ALL_TIMES,
            networkType: NetworkRequestEnum.get,
            showProgress: false,
            dismissProgess: false,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: false,
              showError: true
          )
      );
      return BaseResponsesModel.fromJson(response.data);
    } catch (error) {
      return BaseResponsesModel(status: 500, success: false, data: null, message: 'failed to connect');
    }
  }
  Future<BaseResponsesModel> getAllDurations() async {
    try {
      Response response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_ALL_DURATIONS,
            networkType: NetworkRequestEnum.get,
            showProgress: false,
            dismissProgess: false,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: false,
              showError: true
          )
      );
      return BaseResponsesModel.fromJson(response.data);
    } catch (error) {
      return BaseResponsesModel(status: 500, success: false, data: null, message: 'failed to connect');
    }
  }
  Future<BaseResponsesModel> doctorUpdateWorkTimes(List<WorkingDayModel> dataList) async {
    Map<String,dynamic>data={};
    for(int i= 0 ;i<dataList.length; i++){
      data["working_hour[${i}][day_id]"]=dataList[i].dayId;
      data["working_hour[${i}][time_from_id]"]=dataList[i].timeFromId;
      data["working_hour[${i}][time_to_id]"]=dataList[i].timeToId;
      data["working_hour[${i}][duration_id]"]=dataList[i].durationId;
      data["working_hour[${i}][status]"]=dataList[i].status??"0";
    }
    FormData body = FormData.fromMap(data);
    try {
      Response response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.DOC_UPDATE_TIMES_API,
            networkType: NetworkRequestEnum.post,
            data: body,
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

  Future<BaseResponsesModel> addVacation({required String start_date,required String end_date}) async {

    try {
      Response response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.DOC_ADD_VACATION_API,
            networkType: NetworkRequestEnum.post,
            data: {
              "start_date":start_date,
              "end_date":end_date
            },
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
  Future<BaseResponsesModel> deleteVacation({required String id}) async {

    try {
      Response response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.DELETE_VACATION_API+"/$id",
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