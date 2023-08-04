import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CustomEmailWidget extends StatefulWidget {
  final String? Function(String?)? validator;
  final Function(String value)? onChange;
  final String? hint;
  const CustomEmailWidget(
      {Key? key,
        this.validator,
        this.onChange,
        this.hint,
      }) : super(key: key);

  @override
  State<CustomEmailWidget> createState() => _CustomEmailWidgetState();
}

class _CustomEmailWidgetState extends State<CustomEmailWidget> {
  late final TextEditingController? phoneController;
  @override
  void initState() {
    phoneController=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    phoneController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 10.w),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        controller: phoneController,
        style: TextStyle(color:AppColors.GREY,fontSize: AppFontSize.x_x_small),
        maxLines:1,
        enableInteractiveSelection:true,
        onTapOutside: (value){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email,color: AppColors.BASE_COLOR,size: 7.w,),
            fillColor: Colors.transparent,
            hintStyle: TextStyle(color:AppColors.GREY,fontSize: AppFontSize.x_x_small),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.GREY)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.BASE_COLOR)),
            border: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.GREY)),
            contentPadding: EdgeInsets.zero,
            isDense:false,
            labelText: tr("email_hint"),
            labelStyle: const TextStyle(color: AppColors.GREY),
            counter: SizedBox.shrink()
        ),
        keyboardType:TextInputType.text ,
        cursorColor: AppColors.BASE_COLOR,
        expands: false,
        autofocus: false,
        onChanged: widget.onChange,
        validator:widget.validator,
      ),
    );
  }
}
