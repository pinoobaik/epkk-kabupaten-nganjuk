import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../commons/constants/colors.dart';
import '../../../../commons/constants/typography.dart';

class ForgetPasswordText extends StatelessWidget {
  final VoidCallback onTab;

  const ForgetPasswordText({super.key, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: GestureDetector(
        onTap: onTab,
        child: Align(
          alignment: FractionalOffset.centerRight,
          child: TypographyStyles.bodyCaptionSemiBold(
            'Lupa password?',
            color: TextColors.grey700,
          ),
        ),
      ),
    );
  }
}
