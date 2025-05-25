import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HeaderHome extends StatelessWidget {
  final String textUser;

  const HeaderHome({super.key, required this.textUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: BrandColors.brandPrimary100,
        border: Border(
          bottom: BorderSide(
            width: 1.w,
            color: BrandColors.brandPrimary200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded( 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TypographyStyles.bodySmallMedium(
                      'Selamat datang,',
                      color: TextColors.grey700,
                    ),
                    SizedBox(width: 4.w),
                    Expanded( 
                      child: TypographyStyles.bodySmallSemiBold(
                        textUser,
                        color: BrandColors.brandPrimary500,
                        maxlines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                TypographyStyles.captionReguler(
                  DateFormat('EEEE, dd-MM-yyyy', 'id_ID').format(DateTime.now()),
                  color: TextColors.grey500,
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/logo_pkk.png',
            width: 60.w,
            height: 44.h,
          )
        ],
      )

    );
  }
}
