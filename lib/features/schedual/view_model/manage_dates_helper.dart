import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/providers/manage_dates_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_routes.dart';
import 'package:provider/provider.dart';

mixin ManageDatesHelper{
  onInit()async{
    getAllData();

  }
  getAllData()async{
     AppNavigator().currentContext().read<ManageDatesProvider>().getDoctorWorkingTime();
     AppNavigator().currentContext().read<ManageDatesProvider>().getDoctorVacations();
     AppNavigator().currentContext().read<ManageDatesProvider>().getAllTime();
     AppNavigator().currentContext().read<ManageDatesProvider>().getAllDurations();
  }
  onEditWorkTimesClick(){
    AppNavigator().push(routeName: AppRoutes.EDIT_WORKING_TIMES_SCREEN_ROUTE);
  }
  onAddVacationClick(){
    AppNavigator().push(routeName: AppRoutes.ADD_VACATION_SCREEN_ROUTE);
  }
  onDeleteVacation(String id)async{
    AppNavigator().currentContext().read<ManageDatesProvider>().deleteVacation(id: id);
  }



}