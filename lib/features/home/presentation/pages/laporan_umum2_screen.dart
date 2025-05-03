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

class LaporanUmum2Screen extends StatelessWidget {
  const LaporanUmum2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // hanya tampilan
    final lakilaki1Controller = TextEditingController();
    final perempuan1Controller = TextEditingController();
    final lakilaki2Controller = TextEditingController();
    final perempuan2Controller = TextEditingController();
    final lakilaki3Controller = TextEditingController();
    final perempuan3Controller = TextEditingController();
    final lakilaki4Controller = TextEditingController();
    final perempuan4Controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Laporan Umum',
        currentStep: 2,
        totalSteps: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionBold(
                  'Jumlah Jiwa',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 32.h),
              InputFormField(
                controller: lakilaki1Controller,
                hintText: 'Masukkan jumlah',
                label: 'Laki-laki',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: perempuan1Controller,
                hintText: 'Masukkan jumlah',
                label: 'Perempuan',
              ),

              SizedBox(height: 48.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionBold(
                  'Jumlah Kader',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 32.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionSmallMedium(
                  'Anggota TP PKK',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 16),
              InputFormField(
                controller: lakilaki2Controller,
                hintText: 'Masukkan jumlah',
                label: 'Laki-laki',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: perempuan2Controller,
                hintText: 'Masukkan jumlah',
                label: 'Perempuan',
              ),

              SizedBox(height: 24.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionSmallMedium(
                  'Umum',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 16),
              InputFormField(
                controller: lakilaki3Controller,
                hintText: 'Masukkan jumlah',
                label: 'Laki-laki',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: perempuan3Controller,
                hintText: 'Masukkan jumlah',
                label: 'Perempuan',
              ),

              SizedBox(height: 24.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionSmallMedium(
                  'Khusus',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 16),
              InputFormField(
                controller: lakilaki4Controller,
                hintText: 'Masukkan jumlah',
                label: 'Laki-laki',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: perempuan4Controller,
                hintText: 'Masukkan jumlah',
                label: 'Perempuan',
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
              Get.toNamed(Routes.LAPORAN_UMUM3, arguments: {
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

