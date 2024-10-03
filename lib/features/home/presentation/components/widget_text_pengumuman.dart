import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetTextPengumuman extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String threeText;
  final String svgIcon;

  WidgetTextPengumuman({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.threeText,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TypographyStyles.bodyCaptionSemiBold(
              firstText,
              color: TextColors.grey700,
              overflow: TextOverflow.ellipsis,
              maxlines: 1,
            ),
            TypographyStyles.bodyCaptionSmallReguler(
              secondText,
              color: TextColors.grey600,
              overflow: TextOverflow.ellipsis,
              maxlines: 1,
            ),
          ],
        ),
        Row(
          children: [
            TypographyStyles.bodyCaptionSmallReguler(
              threeText,
              color: BrandColors.brandPrimary500,
              overflow: TextOverflow.ellipsis,
              maxlines: 1,
            ),
            SizedBox(width: 4.w),
            SvgPicture.asset(
              svgIcon,
              width: 20.w,
              height: 20.h,
              color: BrandColors.brandPrimary500,
            ),
          ],
        )
      ],
    );
  }
}
