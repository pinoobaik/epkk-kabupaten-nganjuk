import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PenghayatanPengamalanScreen extends StatelessWidget {
  const PenghayatanPengamalanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // hanya tampilan
    final jumlahkel1Controller = TextEditingController();
    final jumlahanggota1Controller = TextEditingController();
    final jumlahkel2Controller = TextEditingController();
    final jumlahanggota2Controller = TextEditingController();
    final jumlahkel3Controller = TextEditingController();
    final jumlahanggota3Controller = TextEditingController();
    final jumlahkel4Controller = TextEditingController();
    final jumlahanggota4Controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Penghayatan & Pengamalan Pancasila',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionMedium(
                  'Sosialisasi Pendidikan PKBN',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: jumlahkel1Controller,
                hintText: 'Masukkan jumlah',
                label: 'Jumlah Kel. Simulasi',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: jumlahanggota1Controller,
                hintText: 'Masukkan jumlah',
                label: 'Jumlah Anggota',
              ),

              SizedBox(height: 24.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionMedium(
                  'PKDRT',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: jumlahkel2Controller,
                hintText: 'Masukkan jumlah',
                label: 'Jumlah Kel. Simulasi',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: jumlahanggota2Controller,
                hintText: 'Masukkan jumlah',
                label: 'Jumlah Anggota',
              ),

              SizedBox(height: 24.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionMedium(
                  'Pola Asuh',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 12.h),
              InputFormField(
                controller: jumlahkel3Controller,
                hintText: 'Masukkan jumlah',
                label: 'Jumlah Kel. Simulasi',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: jumlahanggota3Controller,
                hintText: 'Masukkan jumlah',
                label: 'Jumlah Anggota',
              ),
              SizedBox(height: 24.h),
              TypographyStyles.bodyCaptionMedium(
                'Lansia',
                color: TextColors.grey700,
              ),
              SizedBox(height: 12.h),
              InputFormField(
                controller: jumlahkel4Controller,
                hintText: 'Masukkan jumlah',
                label: 'Jumlah Kel. Simulasi',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: jumlahanggota4Controller,
                hintText: 'Masukkan jumlah',
                label: 'Jumlah Anggota',
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