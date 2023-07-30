import 'package:enaya_doctor/features/appointments/model/vacation_model.dart';
import 'package:enaya_doctor/features/appointments/model/working_day_model.dart';
import 'package:enaya_doctor/features/appointments/repository/manage_dates_repo.dart';
import 'package:flutter/material.dart';

class ManageDatesProvider with ChangeNotifier{
  List<WorkingDayModel>workingDays=[];
  List<WorkingDayModel>activeWorkingDays=[];
  List<VacationModel>vacations=[];

  bool isLoading=false;



  getDoctorWorkingTime()async{
    isLoading=true;
    workingDays.clear();
    final response = await ManageDatesRepo().getDoctorWorkingTimes();
    workingDays.addAll(WorkingDayModel.fromList(response.data));
    activeWorkingDays.addAll(workingDays.where((element) => element.status=="1"));
    isLoading=false;
    notifyListeners();
  }
  getDoctorVacations()async{
    isLoading=true;
    vacations.clear();
    final response = await ManageDatesRepo().getDoctorVacations();
    vacations.addAll(VacationModel.fromList(response.data));
    isLoading=false;
    notifyListeners();
  }
}