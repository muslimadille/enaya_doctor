import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/providers/manage_dates_provider.dart';
import 'package:provider/provider.dart';

mixin ManageDatesHelper{
  onInit()async{
    getWorkingTimes();
  }
  getWorkingTimes()async{
     AppNavigator().currentContext().read<ManageDatesProvider>().getDoctorWorkingTime();
     AppNavigator().currentContext().read<ManageDatesProvider>().getDoctorVacations();
  }

}