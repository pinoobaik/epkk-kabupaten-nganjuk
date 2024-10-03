import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../_core/component/button/button_fill.dart';
import '../../_core/component/button/button_outline.dart';
import '../../routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final WelcomeController welcomeController = Get.find<WelcomeController>();
  late final id1 = '1';
  late final id2 = '2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/ilustrasi1.png',
                    width: 231.w,
                    height: 295.h,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  TypographyStyles.h1(
                    "Masuk",
                    color: TextColors.grey700,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TypographyStyles.bodyCaptionReguler(
                    "Silahkan pilih button masuk sebagai pengguna desa atau kecamatan untuk melanjutkan ke proses selanjutnya",
                    color: TextColors.grey600,
                    textAlign: TextAlign.center,
                    maxlines: 3,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ZoomTapAnimation(
              child: ButtonFill(
                text: 'Masuk sebagai Desa',
                textColor: Colors.white,
                onPressed: () async {
                  await welcomeController.getRoleUserController(id1);
                  if (welcomeController.roleName.isNotEmpty) {
                    Get.toNamed(
                      Routes.AUTH_LOGIN,
                      arguments: {
                        'roleID': id1,
                        'roleName': welcomeController.roleName.value,
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ZoomTapAnimation(
              child: ButtonOutline(
                text: 'Masuk sebagai Kecamatan',
                textColor: BrandColors.brandPrimary500,
                onPressed: () async {
                  await welcomeController.getRoleUserController(id2);
                  if (welcomeController.roleName.isNotEmpty) {
                    Get.toNamed(
                      Routes.AUTH_LOGIN,
                      arguments: {
                        'roleID': id2,
                        'roleName': welcomeController.roleName.value,
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
