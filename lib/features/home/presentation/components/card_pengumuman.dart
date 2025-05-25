import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CardPengumuman extends StatelessWidget {
  final String title;
  final String subTitle;
  final String dateText;
  final VoidCallback onTab;
  //final String imageAssets;

  CardPengumuman({
    super.key,
    required this.title,
    required this.subTitle,
    required this.dateText,
    required this.onTab,
    //required this.imageAssets,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
            color: TextColors.grey50,
            border: Border.all(
              color: TextColors.grey200,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.mark_email_unread,
                size: 36,
                color: TextColors.grey700,
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypographyStyles.bodyCaptionSemiBold(
                    title,
                    color: TextColors.grey700,
                    overflow: TextOverflow.ellipsis,
                    maxlines: 1,
                  ),
                  SizedBox(height: 5.h),
                  TypographyStyles.bodyCaptionSmallReguler(
                    subTitle,
                    color: TextColors.grey600,
                    overflow: TextOverflow.ellipsis,
                    maxlines: 2,
                  ),
                  SizedBox(height: 5.h),
                  TypographyStyles.bodyCaptionSmallSemiBold(
                    dateText,
                    color: BrandColors.brandPrimary500,
                    overflow: TextOverflow.ellipsis,
                    maxlines: 1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
