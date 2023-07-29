import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/providers/profile_provider.dart';
import 'package:provider/provider.dart';

mixin ProfileHelper{

 onInit()async{
   await AppNavigator().currentContext().read<ProfileProvider>().getDoctorProfile();
 }
}