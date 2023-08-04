import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomGenderWidget extends StatefulWidget {
  final Function(int index) onSelect;
  const CustomGenderWidget({
    required this.onSelect,
    Key? key}) : super(key: key);

  @override
  State<CustomGenderWidget> createState() => _CustomGenderWidgetState();
}

class _CustomGenderWidgetState extends State<CustomGenderWidget> {
  int _selectedIndex=0;
  List<String>names=[
    tr("male"),
    tr("female")
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:10.w),
      child: Row(children: [
        const Icon(Icons.perm_contact_cal_outlined,color: AppColors.BASE_COLOR,),
        Text(tr("gender"),style: TextStyle(color: AppColors.BASE_COLOR),),
        const Expanded(child: SizedBox(),),
        Row(children: List.generate(2, (index){
          return Row(
            children: [
              Text(names[index],style: TextStyle(color: AppColors.GREY),),
              Radio(
                  value:true ,
                  groupValue: _selectedIndex==index,
                  activeColor:AppColors.BASE_COLOR,
                  onChanged: (value){
                    _selectedIndex=index;
                    widget.onSelect(index);
                    setState(() {});
              }),
            ],
          );
        }),)
      ],),
    );
  }
}
