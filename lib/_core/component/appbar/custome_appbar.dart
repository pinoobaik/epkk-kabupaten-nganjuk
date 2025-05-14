import 'package:e_pkk_nganjuk/features/auth/presentation/component/icon_button_back.dart';
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
  final int? currentStep; // <--- TAMBAH
  final int? totalSteps;
  final bool centerTitle;  // <--- TAMBAH

  const CustomeAppBar({
    Key? key,
    required this.title,
    this.onBack,
    this.onTab2,
    this.backgroundColor = Colors.transparent,
    this.elevation,
    this.showBottomBorder = false,
    this.centerTitle = true,
    this.currentStep, // <--- TAMBAH
    this.totalSteps,  // <--- TAMBAH

  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
     
      leading: onBack != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButtonBack(onTab: onBack!),
          )
        : null,

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TypographyStyles.bodySmallBold(
            title,
            textAlign: TextAlign.left,
            color: TextColors.grey700,
          ),
          if (currentStep != null && totalSteps != null)
            //const SizedBox(height: 2),
            TypographyStyles.captionReguler(
              'Langkah $currentStep dari $totalSteps',
              textAlign: TextAlign.left,
              color: TextColors.grey500,
            ),
        ],
      ),
      
      bottom: (showBottomBorder || (currentStep != null && totalSteps != null))
        ? PreferredSize(
            preferredSize: const Size.fromHeight(24),
            child: (currentStep != null && totalSteps != null)
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 0), // Jarak antara subtitle dan progress bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: List.generate(totalSteps!, (index) {
                          bool isActive = index < currentStep!;
                          return Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              height: 8,
                              decoration: BoxDecoration(
                                color: isActive ? Colors.blue : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                )

                : Container(
                    height: 1.0,
                    color: TextColors.grey700,
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
  VoidCallback? onTab2,
  Color? backgroundColor,
  double? elevation,
  int? currentStep, // <--- TAMBAH
  int? totalSteps,  // <--- TAMBAH
  }) : super(
        title: title,
        onBack: onBack,
        backgroundColor: backgroundColor,
        elevation: elevation,
        currentStep: currentStep, // <--- TAMBAH
        totalSteps: totalSteps,   // <--- TAMBAH
        showBottomBorder: false);

}

class AppBarSecondary extends CustomeAppBar {
  AppBarSecondary({
  required String title,
  VoidCallback? onBack,
  VoidCallback? onTab2,
  Color? backgroundColor,
  double? elevation,
  int? currentStep, // <--- TAMBAH
  int? totalSteps,  // <--- TAMBAH
  }) : super(
        title: title,
        centerTitle: false,
        onBack: onBack,
        onTab2: onTab2,
        backgroundColor: backgroundColor,
        elevation: elevation,
        currentStep: currentStep, // <--- TAMBAH
        totalSteps: totalSteps,   // <--- TAMBAH
        showBottomBorder: true);

}
