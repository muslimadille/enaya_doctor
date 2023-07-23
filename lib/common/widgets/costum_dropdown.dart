import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDropdown extends StatefulWidget {
  final double? width;
  final List<String>items;
  final Function(int index) onSelect;
  const CustomDropdown({
    this.width,
    required this.items,
    required this.onSelect,
    Key? key}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String?selectedValue;
  @override
  void initState() {
    selectedValue=widget.items[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      width:widget.width?? 30.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: const BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: DropdownButton<String>(
        isExpanded:true,
        underline: const SizedBox.shrink(),
        value: selectedValue,
        onChanged: (String? newValue) {
          widget.onSelect(widget.items.indexOf(newValue??''));
          setState(() {
            selectedValue=newValue;
          });
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
