import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
/*
* add only the providers that will used over the app life*/
List<SingleChildWidget> providersList=[
  ChangeNotifierProvider<LocalProvider>(
      lazy:true,
      create: (context) => LocalProvider()),
];