import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LaporanUmum3Screen extends StatelessWidget {
  const LaporanUmum3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // hanya tampilan
    final lakilaki1Controller = TextEditingController();
    final perempuan1Controller = TextEditingController();
    final lakilaki2Controller = TextEditingController();
    final perempuan2Controller = TextEditingController();
   
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Laporan Umum',
        currentStep: 3,
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
                  'Jumlah Tenaga Sekretariat',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 32.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionSmallMedium(
                  'Honorer',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 16),
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

              SizedBox(height: 24.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionSmallMedium(
                  'Bantuan',
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

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ZoomTapAnimation(
          child: ButtonFill(
            text: 'UPLOAD',
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

