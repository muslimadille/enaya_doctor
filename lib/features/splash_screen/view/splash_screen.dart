import 'package:enaya_doctor/common/utils/constants/image_paths.dart';
import 'package:enaya_doctor/common/widgets/custom_Progress.dart';
import 'package:enaya_doctor/features/splash_screen/viewModel/splash_screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashScreenHelper {
  @override
  void initState() {
    getCountries();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagePaths.IMG_BACKGROUND),
              fit: BoxFit.cover,
            ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImagePaths.IMG_LOGO_NAME_WHITE),
            const CustomProgressWidget()
          ],),
      ) ,
    );
  }
}
