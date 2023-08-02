import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/widgets/custom_Progress.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/features/more/model/about_us_model.dart';
import 'package:enaya_doctor/features/more/view_model/about_us_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sizer/sizer.dart';

class AboutUsScreen extends StatelessWidget with AboutUsHelper {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomActionBar(
              title: tr("about_us_screen_title"),
            ),
            Expanded(
              child: FutureBuilder<AboutUsModel?>(
                  future: getAboutUs(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: RawScrollbar(
                          thumbColor: AppColors.BASE_COLOR,
                          radius: const Radius.circular(20),
                          thickness: 2.w,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            child: Html(
                              data: LocalProvider().isEnglish()
                                  ? snapshot.data!.aboutUsEn
                                  : snapshot.data!.aboutUsAr,
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return SizedBox();
                    } else {
                      return const Center(
                        child: SizedBox(),
                      );
                    }
                  }),
            ),
          ],
        ));
  }
}
