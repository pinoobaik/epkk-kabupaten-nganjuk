import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CardButtonActions extends StatelessWidget {
  final String titleText;
  final String subTitle;
  final VoidCallback onTab;
  final String imageAssets;
  final String? svgIcon;
  final Color backroundColor;
  final Color strokeColor;

  CardButtonActions({
    super.key,
    required this.titleText,
    required this.subTitle,
    required this.onTab,
    required this.imageAssets,
    this.svgIcon,
    required this.backroundColor,
    required this.strokeColor,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Container(
        decoration: BoxDecoration(
            color: backroundColor,
            border: Border.all(
              color: strokeColor,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          child: ListTile(
            onTap: onTab,
            leading: Image.asset(
              imageAssets,
              width: 43.w,
              height: 43.w,
            ),
            title: TypographyStyles.bodyCaptionSemiBold(
              titleText,
              color: TextColors.grey700,
              overflow: TextOverflow.ellipsis,
              maxlines: 1,
            ),
            subtitle: TypographyStyles.bodyCaptionSmallReguler(
              subTitle,
              color: TextColors.grey600,
              overflow: TextOverflow.ellipsis,
              maxlines: 1,
            ),
            trailing: svgIcon != null
                ? SvgPicture.asset(
                    svgIcon!,
                    width: 24.w,
                    height: 24.h,
                    color: TextColors.grey700,
                  )
                : SvgPicture.asset(
                    'assets/icons/ic_arrow_right.svg',
                    width: 24.w,
                    height: 24.h,
                    color: TextColors.grey700,
                  ),
          ),
        ),
      ),
    );
  }
}
