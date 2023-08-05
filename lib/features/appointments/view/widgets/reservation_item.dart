import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/features/appointments/model/reservation_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReservationItem extends StatefulWidget {
  final ReservationModel reservationModel;

  const ReservationItem({required this.reservationModel, Key? key})
      : super(key: key);

  @override
  State<ReservationItem> createState() => _ReservationItemState();
}

class _ReservationItemState extends State<ReservationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.w),
      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
      decoration: BoxDecoration(
          color: AppColors.WHITE,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: AppColors.BLACK.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1),
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Icon(
                Icons.note_alt_outlined,
                color: AppColors.BASE_COLOR,
                size: 4.5.h,
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.reservationModel.name,
                      style: TextStyle(
                          color: AppColors.GREY, fontSize: AppFontSize.x_small),
                    ),
                    Text(
                      widget.reservationModel.phonenumber,
                      style: TextStyle(
                          color: AppColors.GREY, fontSize: AppFontSize.x_small),
                    )
                  ],
                ),
              ),
              Text(
                DateFormat('h:mm a').format(widget.reservationModel.bookingDate),
                style: TextStyle(
                    color: AppColors.GREY, fontSize: AppFontSize.x_small),
              )
            ],
          ),
          SizedBox(height: 2.h,),
          Row(children: [
            widget.reservationModel.statusId!=2?Expanded(
              child: GestureDetector(
                onTap: (){
                  widget.reservationModel.statusId=3;
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.only(top: 2.w),
                  padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                  decoration: BoxDecoration(
                      color: widget.reservationModel.statusId==3?AppColors.BASE_COLOR:AppColors.WHITE,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.BLACK.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 1),
                      ]),
                  child: Center(child: Text(tr("arrived"),style: TextStyle(color: widget.reservationModel.statusId==3?AppColors.WHITE:AppColors.GREY),),),
                ),
              ),
            ):SizedBox(),
            SizedBox(width: 2.w,),
            widget.reservationModel.statusId!=3?Expanded(
              child: GestureDetector(
                onTap: (){
                  widget.reservationModel.statusId=2;
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.only(top: 2.w),
                  padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                  decoration: BoxDecoration(
                      color: widget.reservationModel.statusId==2?AppColors.RED:AppColors.WHITE,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.BLACK.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 1),
                      ]),
                  child: Center(child: Text(tr("canceled"),style: TextStyle(color: widget.reservationModel.statusId==2?AppColors.WHITE:AppColors.GREY),),),
                ),
              ),
            ):SizedBox()
          ],)
        ],
      ),
    );
  }
}
