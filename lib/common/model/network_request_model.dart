
import 'package:enaya_doctor/common/utils/enums/network_request_enum.dart';

class NetworkRequestModel {
  final String apiCode;
  final Map<String, dynamic>? queryParameters;
  final data;
  final NetworkRequestEnum networkType;
  Map<String,String> header;
  // final Options options;
  final bool showProgress;
  final bool dismissProgess;
  final bool rethrowError;

  NetworkRequestModel(
      {
        required this.apiCode,
        this.queryParameters,
        this.data=null,
        this.networkType=NetworkRequestEnum.post,
        this.header=const {},
        // required this.options,
        this.showProgress=true,
        this.dismissProgess=true,
        this.rethrowError=true
      });
}