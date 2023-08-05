import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomPasswordWidget extends StatefulWidget {
  final String? Function(String?)? validator;
  final Function(String value)? onChange;
  final String? hint;
  final String?errorText;

  const CustomPasswordWidget(
      {Key? key,
        this.validator,
        this.onChange,
        this.hint,
        this.errorText}) : super(key: key);

  @override
  State<CustomPasswordWidget> createState() => _CustomPasswordWidgetState();
}

class _CustomPasswordWidgetState extends State<CustomPasswordWidget> {
  late final TextEditingController? passwordController;
  bool showPassword=false;
  @override
  void initState() {
    passwordController=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        controller: passwordController,
        style: TextStyle(color:AppColors.GREY,fontSize: AppFontSize.x_x_small),
        maxLength:18,
        maxLines:1,
        enableInteractiveSelection:true,
        obscureText: showPassword,
        onTapOutside: (value){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock,color: AppColors.BASE_COLOR,size: 7.w,),
            fillColor: Colors.transparent,
            hintStyle: TextStyle(color:AppColors.GREY,fontSize: AppFontSize.x_x_small),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.GREY)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.BASE_COLOR)),
            border: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.GREY)),
            contentPadding: EdgeInsets.zero,
            isDense:false,
            labelText:widget.hint ,
            labelStyle: const TextStyle(color: AppColors.GREY),
            counter: const SizedBox.shrink(),
          suffixIcon: IconButton(onPressed: () {
            setState(() {
              showPassword=!showPassword;
            });
          }, icon: Icon(showPassword?Icons.visibility:Icons.visibility_off,color: AppColors.BASE_COLOR,),)

        ),
        keyboardType:TextInputType.visiblePassword ,
        cursorColor: AppColors.BASE_COLOR,
        expands: false,
        autofocus: false,
        onChanged: (value){
          if(widget.onChange!=null){
            widget.onChange!(value);
          }
        },
        validator:(value){},
      ),
    );
  }
}
