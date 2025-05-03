import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class LaporanUmum1Screen extends StatelessWidget {
  const LaporanUmum1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // hanya tampilan
    final dusunController = TextEditingController();
    final pkkrwController = TextEditingController();
    final desawismaController = TextEditingController();
    final krtController = TextEditingController();
    final kkController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Laporan Umum',
        currentStep: 1,
        totalSteps: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionBold(
                  'Jumlah Kelompok',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: dusunController,
                hintText: 'Masukkan jumlah',
                label: 'Dusun/Lingkungan',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: pkkrwController,
                hintText: 'Masukkan jumlah',
                label: 'PKK RW',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: desawismaController,
                hintText: 'Masukkan jumlah',
                label: 'Desa Wisma',
              ),

              SizedBox(height: 48.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionBold(
                  'Jumlah',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: krtController,
                hintText: 'Masukkan jumlah',
                label: 'KRT',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: kkController,
                hintText: 'Masukkan jumlah',
                label: 'KK',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ZoomTapAnimation(
          child: ButtonFill(
            text: 'Lanjut',
            textColor: Colors.white,
            onPressed: () {
              Get.toNamed(Routes.LAPORAN_UMUM2, arguments: {
                        // 'role': role,
                        // 'role_bidang': roleBidang,
                      });
            },
          ),
        ),
      ),
    );
  }
}

