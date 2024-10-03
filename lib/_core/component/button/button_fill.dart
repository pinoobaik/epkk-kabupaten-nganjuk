import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonFill extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback? onPressed;
  final bool isLoading;

  const ButtonFill({
    Key? key,
    required this.text,
    required this.textColor,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isLoading ? TextColors.grey500 : BrandColors.brandPrimary500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: isLoading
              ? _rowLoading()
              : TypographyStyles.button(
                  text,
                  color: textColor,
                ),
        ),
      ),
    );
  }

  Widget _rowLoading() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TypographyStyles.button(
          'Loading...',
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2.5.w,
          ),
        )
      ],
    );
  }
}
