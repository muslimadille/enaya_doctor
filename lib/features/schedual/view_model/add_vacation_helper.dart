import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/providers/manage_dates_provider.dart';
import 'package:provider/provider.dart';

mixin AddVacationHelper{
  addVacation({required String start_date,required String end_date}) async{
    await AppNavigator().currentContext().read<ManageDatesProvider>().addVacation(start_date: start_date,end_date:end_date);
    AppNavigator().goBack();
  }
}