import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/providers/country_provider.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/common/utils/constants/image_paths.dart';
import 'package:enaya_doctor/common/widgets/costum_dropdown.dart';
import 'package:enaya_doctor/features/splash_screen/viewModel/select_country_screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../common/utils/constants/app_colors.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> with SelectCountryScreenHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePaths.IMG_BACKGROUND),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              tr('register'),
              style: const TextStyle(color: AppColors.WHITE),
            ),
            Image.asset(ImagePaths.IMG_LOGO_NAME_WHITE),
            Text(
              tr('select_country'),
              style: const TextStyle(

                  color: AppColors.WHITE,fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 2.h,),
            CustomDropdown(
              items: List.generate(
                  context.read<CountryProvider>().allCountries.length, (index) {
                return LocalProvider().isEnglish()?context
                    .read<CountryProvider>()
                    .allCountries[index]
                    .nameEn:context
                    .read<CountryProvider>()
                    .allCountries[index]
                    .nameAr;
              }),
              onSelect: (int index) {
                context.read<CountryProvider>().setSelectedCountry(context.read<CountryProvider>().allCountries[index]);
              },
            ),
            SizedBox(height: 2.h,),
            Text(
              tr('select_language'),
              style: const TextStyle(

                  color: AppColors.WHITE,fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 2.h,),
            CustomDropdown(
              items: List.generate(
                  context.read<LocalProvider>().languagesList.length, (index) {
                return context.read<LocalProvider>().languagesList[index];
              }),
              onSelect: (int index) {
                context.read<LocalProvider>().setLanguage(context.read<LocalProvider>().languagesList[index]);
              },
            ),
            SizedBox(height: 15.h,),
            InkWell(
              onTap: (){
                onNext();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  tr('next'),
                  style:  TextStyle(fontSize: AppFontSize.x_x_large,color: AppColors.WHITE,fontWeight: FontWeight.w700),
                ),
                Icon(Icons.navigate_next,color: AppColors.LIGHT_GREEN,)
              ],),
            )
          ],
        ),
      ),
    );
  }
}
