import 'package:enaya_doctor/common/providers/appointments_provider.dart';
import 'package:enaya_doctor/common/providers/country_provider.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/providers/manage_dates_provider.dart';
import 'package:enaya_doctor/common/providers/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
/*
* add only the providers that will used over the app life*/
List<SingleChildWidget> providersList=[
  ChangeNotifierProvider<LocalProvider>(
      lazy:false,
      create: (context) => LocalProvider()),

  ChangeNotifierProvider<CountryProvider>(
      lazy:false,
      create: (context) => CountryProvider()),

  ChangeNotifierProvider<ProfileProvider>(
      lazy:false,
      create: (context) => ProfileProvider()),

  ChangeNotifierProvider<ManageDatesProvider>(
      lazy:false,
      create: (context) => ManageDatesProvider()),

  ChangeNotifierProvider<AppointmentsProvider>(
      lazy:false,
      create: (context) => AppointmentsProvider()),


];