import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/helper/my_app_helper.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    required this.onSelectImage,
    Key? key}) : super(key: key);
  final Function(XFile file,String bsae64)onSelectImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: ()async{
              XFile? file= await MyAppHelper().galleryPickImage();
              String base64=await MyAppHelper().imageToBase64(image: file!);
              onSelectImage(file,base64);
            }, //label text
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor:AppColors.BASE_COLOR,
              disabledBackgroundColor: AppColors.LIGHT_GREY,
              disabledForegroundColor: AppColors.LIGHT_GREY,
              disabledMouseCursor: SystemMouseCursors.forbidden,
              padding: EdgeInsets.symmetric(vertical:2.h),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 1,
                    color: AppColors.BASE_COLOR
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child:SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image,color: AppColors.BASE_COLOR,),
                  SizedBox(width: 2.w,),
                  Text(tr("pick_image"),
                    style: TextStyle(
                      color: AppColors.BASE_COLOR,
                      fontSize: AppFontSize.x_x_small,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            )
        ),
        SizedBox(height: 3.h,),
        ElevatedButton(
          onPressed: ()async{
            XFile? file= await MyAppHelper().cameraPickImage();
            String base64=await MyAppHelper().imageToBase64(image: file!);
            onSelectImage(file,base64);
            AppNavigator().goBack();
          },
          child:SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.camera_alt_outlined,color: AppColors.BASE_COLOR,),
                SizedBox(width: 2.w,),
                Text("pick_camera",
                  style: TextStyle(
                    color: AppColors.BASE_COLOR,
                    fontSize: AppFontSize.x_x_small,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ), //label text
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor:AppColors.WHITE,
            disabledBackgroundColor: AppColors.LIGHT_GREY,
            disabledForegroundColor: AppColors.LIGHT_GREY
            ,
            disabledMouseCursor: SystemMouseCursors.forbidden,
            padding: EdgeInsets.symmetric(vertical:2.h),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1,
                  color: AppColors.BASE_COLOR
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
