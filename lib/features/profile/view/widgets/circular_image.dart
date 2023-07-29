import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CircularImage extends StatelessWidget {
  final String image;
  final double? size;
  final Color? borderColor;
  const CircularImage({
    required  this.image,
    this.size,
    this.borderColor,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size??10.w,
      height: size??10.w,
      decoration:  BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        border: Border.all(color:borderColor??AppColors.BASE_COLOR ),
        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(image,))
      ),
    );
  }
}
