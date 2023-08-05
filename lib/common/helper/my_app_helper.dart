import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/helper/check_internet.dart';
import 'package:enaya_doctor/common/utils/constants/app_routes.dart';
import 'package:enaya_doctor/features/appointments/model/appointments_dates_model.dart';
import 'package:enaya_doctor/features/appointments/view/screens/appoointment_hours_screen.dart';
import 'package:enaya_doctor/features/appointments/view/screens/booking_screen.dart';
import 'package:enaya_doctor/features/appointments/view/screens/doctor_appoinments_screen.dart';
import 'package:enaya_doctor/features/appointments/view/screens/doctor_appointment_times_screen.dart';
import 'package:enaya_doctor/features/auth/view/screens/login_screen.dart';
import 'package:enaya_doctor/features/auth/view/screens/register_screen.dart';
import 'package:enaya_doctor/features/home_screen/view/home_screen.dart';
import 'package:enaya_doctor/features/more/view/screens/about_us_screen.dart';
import 'package:enaya_doctor/features/more/view/screens/change_language_screen.dart';
import 'package:enaya_doctor/features/schedual/view/screens/add_vacation_screen.dart';
import 'package:enaya_doctor/features/schedual/view/screens/edit_working_times_screen.dart';
import 'package:enaya_doctor/features/splash_screen/view/select_country_screen.dart';
import 'package:enaya_doctor/features/splash_screen/view/select_user_screen.dart';
import 'package:enaya_doctor/features/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:enaya_doctor/common/helper/image_picker.dart';
import 'dart:convert';

import 'package:sizer/sizer.dart';

mixin class MyAppHelper{

  initConnection(){
    bool isConnectionShowing = false;
    CheckInternet connectionStatus = CheckInternet();
    connectionStatus.initialize();
    connectionStatus.connectionChange.listen((hasConnection){
      if (hasConnection) {
        if (isConnectionShowing) {
          AppNavigator().goBack();
          // OverlayCustom().hideOverlay();
        }
      } else {
        isConnectionShowing = true;
        //AppNavigator().push(routeName: AppRoutes.NO_INTERNET_SCREEN_ROUTE);
      }
    });
  }

  Future<DateTime?> pickDate() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final DateTime? picked = await showDatePicker(
        context: AppNavigator().currentContext(),
        initialDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        firstDate: DateTime.now(),
        lastDate: DateTime(2090, 8)
    );
    return picked;
  }

  Future<XFile?> galleryPickImage() async {
    //AppNavigator().goBack();
    XFile? image=await PickerImage().pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<XFile?> cameraPickImage() async {
    //AppNavigator().goBack();
    XFile? image=await PickerImage().pickImage(source: ImageSource.camera);
    return image;
  }

  Future<String> imageToBase64({required XFile image}) async {
  //  final CroppedFile? cropImage=await PickerImage().cropImage(imagePath: image.path);
   // final XFile? compressImage=await PickerImage().compressImage(imagePath: cropImage!.path, newPath: cropImage!.path.split(".")[0]+"compressed.jpg", imageQuality: 50);
    Uint8List imagebytes = await image!.readAsBytes();
    return base64.encode(imagebytes).toString();
  }
  showDialogWidget({
    bool isDismissible=true,
    required Widget widget,
  }){
    showDialog(
      context: AppNavigator().currentContext(),
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return SimpleDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 7.w),
            contentPadding: EdgeInsets.all(2.h),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(10)
                )
            ),
            children:[
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: widget
              )
            ]
        );
      },
    );
  }

 /* Widget startRoutSelector(){
    if(LocalStorage().getFromBox(key: StorageKeys.IS_NOT_FRIST_TIME)??false){
      return  Container();
    }else{
      return  Container();
    }
  }*/

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.SPLASH_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const SplashScreen());

      case AppRoutes.SELECT_USER_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const SelectUserScreen());

      case AppRoutes.SELECT_COUNTRY_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const SelectCountryScreen());

      case AppRoutes.LOGIN_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const LoginScreen());

      case AppRoutes.HOME_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());

    case AppRoutes.EDIT_WORKING_TIMES_SCREEN_ROUTE:
    return MaterialPageRoute(builder: (_) =>  const EditWorkingTimesScreen());

      case AppRoutes.ADD_VACATION_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const AddVacationScreen());

      case AppRoutes.CHANGE_LANGUAGE_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const ChangeLanguageScreen());

      case AppRoutes.ABOUT_US_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const AboutUsScreen());

        case AppRoutes.REGISTER_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const RegisterScreen());

      case AppRoutes.DOCTOR_APPOINTMENTS_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>   DoctorAppointmentsScreen(date: routeSettings.arguments as DateTime,));

      case AppRoutes.DOCTOR_APPOINTMENT_TIMES_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>   DoctorAppointmentTimesScreen());

      case AppRoutes.DOCTOR_APPOINTMENTS_HOURS_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>   AppointmentHoursScreen(date:routeSettings.arguments as Date ,));
      case AppRoutes.DOCTOR_BOOKING_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>   BookingScreen(date:routeSettings.arguments as Date ,));


      default:
        return MaterialPageRoute(builder: (_) =>  const SplashScreen());
    }
  }
}