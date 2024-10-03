import 'package:flutter/material.dart';

import '../../../commons/constants/colors.dart';
import '../../../commons/constants/typography.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onTab2;
  final Color? backgroundColor;
  final double? elevation;
  final bool showBottomBorder;

  const CustomeAppBar({
    Key? key,
    required this.title,
    this.onBack,
    this.onTab2,
    this.backgroundColor = Colors.transparent,
    this.elevation,
    this.showBottomBorder = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: true,
      leading: onBack != null
          ? IconButton(
              onPressed: onBack,
              icon: Icon(
                Icons.arrow_back,
                color: TextColors.grey100,
                size: 24,
              ),
            )
          : null,
      title: TypographyStyles.bodySmallSemiBold(
        title,
        textAlign: TextAlign.center,
        color: TextColors.grey700,
      ),
      bottom: showBottomBorder
          ? PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: TextColors.grey700,
                height: 1.0,
              ),
            )
          : null,
      actions: onTab2 != null
          ? [
              IconButton(
                onPressed: onTab2,
                icon: Icon(
                  Icons.filter_alt_rounded,
                  size: 24,
                  color: TextColors.grey700,
                ),
              ),
            ]
          : null,
    );
  }
}

class AppBarPrimary extends CustomeAppBar {
  AppBarPrimary({
    required String title,
    VoidCallback? onBack,
    Color? backgroundColor,
    double? elevation,
  }) : super(
            title: title,
            onBack: onBack,
            backgroundColor: backgroundColor,
            elevation: elevation,
            showBottomBorder: false);
}

class AppBarSecondary extends CustomeAppBar {
  AppBarSecondary({
    required String title,
    VoidCallback? onBack,
    Color? backgroundColor,
    double? elevation,
  }) : super(
            title: title,
            onBack: onBack,
            backgroundColor: backgroundColor,
            elevation: elevation,
            showBottomBorder: true // Show the bottom border
            );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: onBack != null
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: TextColors.grey700,
              ),
              onPressed: onBack,
            )
          : null,
      title: TypographyStyles.bodySmallSemiBold(title),
      // Use body text style for the title
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: TextColors.grey700,
          height: 1.0,
        ),
      ),
    );
  }
}
