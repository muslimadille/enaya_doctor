class ApiBaseUrl {
  static const String SERVER_DEV = 'https://dashboard.enaya.care/api/';
  static const String SERVER_DOMAIN = 'https://dashboard.enaya.care/';
  static const String SERVER_STG = '';
  static const String SERVER_PRO = '';
}

class ApiCodes {
  static const String CUNTRIES = 'country';
  static const String LOGIN = 'doctor/login';
  static const String GET_DOCTOR_OFFERS = "doctor/dashboard/offers";
  static const String GET_DOCTOR_PROFILE = "doctor/dashboard/profile";
  static const String GET_DOCTOR_WORKING_HOURS = "doctor/dashboard/working-hours";
  static const String GET_DOCTOR_VACATIONS = "doctor/dashboard/vacations";
  static const String UPDATE_DOCTOR_WORKING_HOURS= "doctor/dashboard/working-hours/update";
  static const String GET_ALL_TIMES = "doctor/dashboard/times";
  static const String GET_ALL_DURATIONS = "doctor/dashboard/durations";
  static const String DOC_UPDATE_TIMES_API = "doctor/dashboard/working-hours/update";
  static const String DOC_ADD_VACATION_API = "doctor/dashboard/vacation/add";
  static const String DELETE_VACATION_API = "doctor/dashboard/vacation/delete";
  static const String ABOUT_US_API = "admin/aboutUs";
  static const String DOC_REGISTER_API = "doctor/register";
  static const String DOCTORS_DATES_API = "dates";

}
