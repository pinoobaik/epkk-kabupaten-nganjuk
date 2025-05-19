import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/card_profil_button.dart';
import 'package:e_pkk_nganjuk/get/controller/auth_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/nav_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/profil_controller.dart';
import 'package:e_pkk_nganjuk/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AkunPage extends StatelessWidget {
  AkunPage({super.key});

  final ProfilController profilController = Get.find<ProfilController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TextColors.grey50, 
      appBar: AppBarPrimary(
        title: 'Profil',
        backgroundColor: Colors.white,
        onBack: () {
          final NavController navController = Get.find<NavController>();
          navController.changeTabIndex(0);
          Get.back();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardButtonRow(
                      leadingIcon: Icons.person_outline,
                      titleText: 'Informasi Akun',
                      onTap: () {
                        Get.toNamed(Routes.INFO_AKUN);
                      },
                      backgroundColor: TextColors.grey100,
                      strokeColor: TextColors.grey200,
                      iconColor: Colors.grey.shade800,
                    ),

                    SizedBox(height: 14.h),

                    CardButtonRow(
                      leadingIcon: Icons.lock_outline,
                      titleText: 'Ubah Kata Sandi',
                      onTap: () {
                        Get.toNamed(Routes.EDIT_PASSWORD);
                      },
                      backgroundColor: TextColors.grey100,
                      strokeColor: TextColors.grey200,
                      iconColor: Colors.grey.shade800,
                    ),

                    SizedBox(height: 14.h),

                    CardButtonRow(
                      leadingIcon: Icons.logout,
                      titleText: 'Keluar',
                      onTap: () {
                        Get.defaultDialog(
                          title: "Konfirmasi",
                          middleText: "Yakin ingin keluar dari aplikasi?",
                          textCancel: "Batal",
                          textConfirm: "Keluar",
                          confirmTextColor: Colors.white,
                          onConfirm: () {
                            authController.logout();
                          },
                        );
                      },
                      backgroundColor: TextColors.grey100,
                      strokeColor: TextColors.grey200,
                      iconColor: Colors.red.shade400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
