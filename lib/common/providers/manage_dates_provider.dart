import 'package:enaya_doctor/features/schedual/model/vacation_model.dart';
import 'package:enaya_doctor/features/schedual/model/working_day_model.dart';
import 'package:enaya_doctor/features/schedual/model/working_duration_model.dart';
import 'package:enaya_doctor/features/schedual/model/working_time_model.dart';
import 'package:enaya_doctor/features/schedual/repository/manage_dates_repo.dart';
import 'package:flutter/material.dart';



class ManageDatesProvider with ChangeNotifier{
  List<WorkingDayModel>workingDays=[];
  List<WorkingDayModel>activeWorkingDays=[];
  List<VacationModel>vacations=[];
  List<WorkingTImeModel>allTimes=[];
  List<WorkingDurationModel>allDurations=[];
  bool isLoading=false;



  getDoctorWorkingTime()async{
    isLoading=true;
    workingDays.clear();
    activeWorkingDays.clear();
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
  getAllTime()async{
    allTimes.clear();
    final response = await ManageDatesRepo().getAllTimes();
    allTimes.addAll(WorkingTImeModel.fromList(response.data));
    notifyListeners();
  }

  getAllDurations()async{
    allDurations.clear();
    final response = await ManageDatesRepo().getAllDurations();
    allDurations.addAll(WorkingDurationModel.fromList(response.data));
    notifyListeners();
  }
  updateDoctorWorkDays()async{
    await ManageDatesRepo().doctorUpdateWorkTimes(workingDays);
    await getDoctorWorkingTime();

  }
  addVacation({required String start_date,required String end_date})async{
    await ManageDatesRepo().addVacation(start_date:start_date,end_date:end_date);
    getDoctorVacations();
  }
  deleteVacation({required String id})async{
    await ManageDatesRepo().deleteVacation(id: id);
    getDoctorVacations();
  }
}